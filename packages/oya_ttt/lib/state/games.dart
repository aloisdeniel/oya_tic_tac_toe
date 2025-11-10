import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

final $currentGame = AsyncNotifierProvider(CurrentGameNotifier.new);

class CurrentGameNotifier extends AsyncNotifier<Game?> {
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

  Future<Game> start({
    required GamePlayer player1,
    required GamePlayer player2,
    required GameMode mode,
  }) async {
    final initialState = mode == GameMode.basic
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

  Future<void> updateState(GameState newState) async {
    if (state case AsyncData(:Game value)) {
      state = AsyncData(value.copyWith(state: newState));
      final db = ref.watch($database);
      await db.saveGameState(value.id, newState);
    }
  }
}

final $nextPlayer = Provider<GamePlayer?>((ref) {
  final game = ref.watch($currentGame);
  final id = game.value?.state.nextPlayer;
  if (id == null) return null;
  return game.value?.player(id);
});

final $nextPlayerCharacter = Provider<GameCharacter?>((ref) {
  final player = ref.watch($nextPlayer);
  return player?.character;
});

final $gameTime = StreamProvider<Duration>((ref) {
  final start = ref.watch($currentGame).value?.startedAt;
  if (start == null) return Stream.value(Duration.zero);
  return Stream.periodic(const Duration(milliseconds: 500), (i) {
    return DateTime.now().difference(start);
  });
});
