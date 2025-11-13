import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/services/database/database.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt/state/users.dart';

/// Provider for all stats in the application.
///
/// This provider loads all game statistics from the database.
final $allStats = FutureProvider<List<StatRecord>>((ref) async {
  final db = ref.watch($database);
  return db.loadAllStats();
});

/// Provider for stats specific to the current user.
///
/// Returns all stats where the current user was a participant.
/// Returns an empty list if there is no current user.
final $userStats = FutureProvider<List<StatRecord>>((ref) async {
  final userId = await ref.watch($userId.future);
  if (userId == null) return [];
  
  final db = ref.watch($database);
  return db.loadStatsByUser(userId);
});

/// Computed statistics for the current user.
///
/// This class provides aggregated statistics like win/loss counts,
/// total games played, and win rate.
class UserStatistics {
  final int wins;
  final int losses;
  final int draws;
  final int totalGames;
  final double winRate;

  UserStatistics({
    required this.wins,
    required this.losses,
    required this.draws,
    required this.totalGames,
    required this.winRate,
  });
}

/// Provider that computes aggregated statistics for the current user.
///
/// Calculates:
/// - Total wins (games won by the current user)
/// - Total losses (games lost by the current user)
/// - Total draws (games that ended in a draw)
/// - Total games played
/// - Win rate percentage
final $userStatistics = FutureProvider<UserStatistics>((ref) async {
  final userId = await ref.watch($userId.future);
  if (userId == null) {
    return UserStatistics(
      wins: 0,
      losses: 0,
      draws: 0,
      totalGames: 0,
      winRate: 0.0,
    );
  }

  final stats = await ref.watch($userStats.future);
  
  int wins = 0;
  int losses = 0;
  int draws = 0;

  for (final stat in stats) {
    if (stat.wonBy == null) {
      draws++;
    } else {
      // Check if the current user was player 1 or player 2
      final isPlayer1 = stat.userId1 == userId;
      final isPlayer2 = stat.userId2 == userId;
      
      // wonBy: 1 means player1 won, 2 means player2 won
      if ((isPlayer1 && stat.wonBy == 1) || (isPlayer2 && stat.wonBy == 2)) {
        wins++;
      } else {
        losses++;
      }
    }
  }

  final totalGames = stats.length;
  final winRate = totalGames > 0 ? (wins / totalGames) * 100 : 0.0;

  return UserStatistics(
    wins: wins,
    losses: losses,
    draws: draws,
    totalGames: totalGames,
    winRate: winRate,
  );
});

/// Notifier for managing game statistics.
///
/// This notifier handles creating new stat records when games are completed.
final $statsNotifier = AsyncNotifierProvider(StatsNotifier.new);

class StatsNotifier extends AsyncNotifier<void> {
  final Logger logger = Logger('StatsNotifier');

  @override
  Future<void> build() async {
    // No initial state needed
  }

  /// Creates a stat record for a completed game.
  ///
  /// Parameters:
  /// - [gameId]: The ID of the game
  /// - [userId1]: The ID of player 1 (null if AI)
  /// - [userId2]: The ID of player 2 (null if AI)
  /// - [wonBy]: 1 if player 1 won, 2 if player 2 won, null for draw
  /// - [durationSeconds]: The duration of the game in seconds
  Future<void> createStat({
    required int gameId,
    int? userId1,
    int? userId2,
    int? wonBy,
    required int durationSeconds,
  }) async {
    try {
      final db = ref.watch($database);
      await db.createStat(
        gameId: gameId,
        userId1: userId1,
        userId2: userId2,
        wonBy: wonBy,
        durationSeconds: durationSeconds,
      );
      
      // Invalidate stats providers to trigger refresh
      ref.invalidate($allStats);
      ref.invalidate($userStats);
      ref.invalidate($userStatistics);
      
      logger.info('Created stat for game $gameId');
    } catch (e, st) {
      logger.severe('Failed to create stat', e, st);
      rethrow;
    }
  }
}
