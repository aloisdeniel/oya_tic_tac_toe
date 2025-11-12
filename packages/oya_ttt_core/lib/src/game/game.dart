import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/src/game/classic/classic.dart';
import 'package:oya_ttt_core/src/game/meta/meta.dart';
import 'package:oya_ttt_core/src/game/player.dart';

part 'game.mapper.dart';

@MappableEnum()
enum GameMode { classic, meta }

@MappableClass()
class Game with GameMappable {
  const Game({
    required this.id,
    required this.player1,
    required this.player2,
    required this.state,
    required this.startedAt,
  });

  final int id;
  final GamePlayer player1;
  final GamePlayer player2;
  final GameState state;
  final DateTime startedAt;

  GameMode get mode {
    return switch (state) {
      BasicGameState() => GameMode.classic,
      MetaGameState() => GameMode.meta,
      _ => throw Exception('Unsupported $state'),
    };
  }

  bool get isOver => state.isOver;

  bool get isDraw => state.isDraw;

  GamePlayer? get winner {
    return switch (state.winner) {
      GamePlayerId id => player(id),
      null => null,
    };
  }

  GamePlayer player(GamePlayerId id) {
    return switch (id) {
      GamePlayerId.player1 => player1,
      GamePlayerId.player2 => player2,
    };
  }

  Game withState(GameState newState) {
    return Game(
      id: id,
      player1: player1,
      player2: player2,
      startedAt: startedAt,
      state: newState,
    );
  }
}

@MappableClass(
  discriminatorKey: 'type',
  includeSubClasses: [BasicGameState, MetaGameState],
)
abstract class GameState with GameStateMappable {
  const GameState();

  /// Winner, or null if none yet.
  GamePlayerId? get winner;

  /// True if no winner and no spaces left.
  bool get isDraw;

  /// True if the game is finished.
  bool get isOver;

  GamePlayerId get nextPlayer;

  int get turn;
}

extension GameStateExtensions on GameState {
  GameMode get mode => switch (this) {
    BasicGameState() => GameMode.classic,
    MetaGameState() => GameMode.meta,
    _ => throw Exception(),
  };
}
