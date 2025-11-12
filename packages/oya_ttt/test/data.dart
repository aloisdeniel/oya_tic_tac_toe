import 'package:oya_ttt_core/oya_ttt_core.dart';

const user = User(id: 0, name: 'John', favoriteCharacter: GameCharacter.circle);

final emptyBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.cross),
  state: BasicGameState.initial(),
  startedAt: DateTime.now(),
);

final inGameBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.cross),
  state: BasicGameState.initial()
      .play(Position(0, 0))
      .play(Position(0, 1))
      .play(Position(1, 0))
      .play(Position(2, 0))
      .play(Position(1, 1)),
  startedAt: DateTime.now().subtract(const Duration(minutes: 1, seconds: 4)),
);
final p1WonBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.cross),
  state: BasicGameState.initial()
      .play(Position(0, 0))
      .play(Position(0, 1))
      .play(Position(1, 0))
      .play(Position(2, 0))
      .play(Position(1, 1))
      .play(Position(2, 1))
      .play(Position(2, 2)),
  startedAt: DateTime.now().subtract(const Duration(minutes: 1, seconds: 4)),
);
final p2WonBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.cross),
  state: BasicGameState.initial()
      .play(Position(0, 0))
      .play(Position(0, 1))
      .play(Position(2, 2))
      .play(Position(1, 1))
      .play(Position(1, 0))
      .play(Position(2, 1)),
  startedAt: DateTime.now().subtract(const Duration(minutes: 1, seconds: 4)),
);
