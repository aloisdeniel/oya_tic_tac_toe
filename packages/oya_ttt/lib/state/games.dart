import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

/// Provider for the current active game.
///
/// This provider manages the current game state, including starting new games,
/// handling player moves, and managing AI moves.
final $currentGame = AsyncNotifierProvider(CurrentGameNotifier.new);

/// Notifier that manages the current game state.
///
/// This notifier handles:
/// - Loading the current game from persistent storage
/// - Starting new games with specified players and mode
/// - Processing player moves
/// - Managing AI opponent moves
/// - Updating game state and persisting changes to the database
class CurrentGameNotifier extends AsyncNotifier<Game?> {
  /// Builds the initial state by loading the current game from storage.
  ///
  /// Returns the current game if one exists, otherwise returns null.
  /// The current game ID is retrieved from shared preferences.
  @override
  Future<Game?> build() async {
    final prefs = ref.watch($sharedPreferences);
    final gameId = await prefs.getInt('current_game_id');
    if (gameId == null) {
      return null;
    }

    final db = ref.watch($database);
    return await db.loadGame(gameId);
  }

  /// Starts a new game with the specified players and mode.
  ///
  /// Parameters:
  /// - [player1]: The first player
  /// - [player2]: The second player (can be AI)
  /// - [mode]: The game mode (classic or meta)
  ///
  /// Returns the newly created [Game] instance.
  /// The game is persisted to the database and the state is updated.
  Future<Game> start({
    required GamePlayer player1,
    required GamePlayer player2,
    required GameMode mode,
  }) async {
    final initialState = mode == GameMode.classic
        ? BasicGameState.initial() as GameState
        : MetaGameState.initial() as GameState;

    final db = ref.watch($database);
    final id = await db.createGame(
      player1: player1,
      player2: player2,
      mode: mode,
    );
    final newGame = Game(
      id: id,
      player1: player1,
      player2: player2,
      state: initialState,
      startedAt: DateTime.now(),
    );

    state = AsyncData(newGame);
    return newGame;
  }

  /// Processes a player's move at the specified [position].
  ///
  /// If the game is against an AI opponent and the game is not over after
  /// the player's move, the AI will automatically make its move after a
  /// 1-second delay.
  Future<void> play(Position position) async {
    if (state case AsyncData(
      value: Game(
        player2: GamePlayer(isAI: final againstAi),
        state: BasicGameState state,
      ),
    )) {
      final newState = state.play(position);
      final aiPlay = !newState.isOver && againstAi;
      updateState(newState, aiPlay);
      if (aiPlay) {
        await Future.delayed(const Duration(seconds: 1));
        final aiMove = newState.calculateNextMove();
        updateState(newState.play(aiMove.pos), againstAi);
      }
    }
  }

  /// Updates the game state and persists it to the database.
  ///
  ///  When [isLoading], the state update is part of a loading process
  Future<void> updateState(GameState newState, bool isLoading) async {
    if (state case AsyncData(:Game value)) {
      final newAsyncState = AsyncData(value.copyWith(state: newState));
      state = newAsyncState;
      final db = ref.watch($database);
      await db.saveGameState(value.id, newState);
    }
  }
}

/// Provider that returns the next player to move in the current game.
///
/// Returns null if there is no current game or no next player.
final $nextPlayer = Provider<GamePlayer?>((ref) {
  final game = ref.watch($currentGame);
  final id = game.value?.state.nextPlayer;
  if (id == null) return null;
  return game.value?.player(id);
});

/// Provider that indicates whether the next player is an AI.
///
/// Returns null if there is no next player.
final $nextPlayerIsAi = Provider<bool?>((ref) {
  final player = ref.watch($nextPlayer);
  return player?.isAI;
});

/// Provider that returns the character of the next player to move.
///
/// Returns null if there is no next player.
final $nextPlayerCharacter = Provider<GameCharacter?>((ref) {
  final player = ref.watch($nextPlayer);
  return player?.character;
});

/// Stream provider that emits the elapsed time since the game started.
///
/// Emits a new duration every 500 milliseconds.
/// Returns Duration.zero if there is no current game.
final $gameTime = StreamProvider<Duration>((ref) {
  final start = ref.watch($currentGame).value?.startedAt;
  if (start == null) return Stream.value(Duration.zero);
  return Stream.periodic(const Duration(milliseconds: 500), (i) {
    return DateTime.now().difference(start);
  });
});
