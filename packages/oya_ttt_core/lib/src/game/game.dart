import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/src/game/basic/basic.dart';
import 'package:oya_ttt_core/src/game/meta/meta.dart';
import 'package:oya_ttt_core/src/game/player.dart';

part 'game.mapper.dart';

@MappableEnum()
enum GameMode { basic, meta }

@MappableClass()
class Game with GameMappable {
  const Game({
    required this.id,
    required this.player1,
    required this.player2,
    required this.state,
  });

  final int id;
  final GamePlayer player1;
  final GamePlayer player2;
  final GameState state;

  GameMode get mode {
    return switch (state) {
      BasicGameState() => GameMode.basic,
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
}

extension GameStateExtensions on GameState {
  GameMode get mode => switch (this) {
    BasicGameState() => GameMode.basic,
    MetaGameState() => GameMode.meta,
    _ => throw Exception(),
  };
}
