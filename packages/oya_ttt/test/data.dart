import 'package:oya_ttt/state/stats.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

const user = User(id: 0, name: 'John', favoriteCharacter: GameCharacter.circle);

final emptyBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: BasicGameState.initial(),
  startedAt: DateTime.now(),
);

final inGameBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
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
  player2: GamePlayer.ai(GameCharacter.robot),
  state: BasicGameState.initial()
      .play(Position(0, 0))
      .play(Position(0, 1))
      .play(Position(1, 0))
      .play(Position(2, 0))
      .play(Position(1, 1))
      .play(Position(2, 1))
      .play(Position(2, 2)),
  startedAt: DateTime.now().subtract(const Duration(minutes: 2, seconds: 26)),
);
final p2WonBasicGame = Game(
  id: 0,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: BasicGameState.initial()
      .play(Position(0, 0))
      .play(Position(0, 1))
      .play(Position(2, 2))
      .play(Position(1, 1))
      .play(Position(1, 0))
      .play(Position(2, 1)),
  startedAt: DateTime.now().subtract(const Duration(minutes: 2, seconds: 26)),
);

final stats = UserStatistics(
  wins: 12,
  losses: 5,
  draws: 3,
  totalGames: 20,
  winRate: 12 / 20,
);

// Meta game test data
final emptyMetaGame = Game(
  id: 1,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: MetaGameState.initial(),
  startedAt: DateTime.now(),
);

final inGameMetaGame = Game(
  id: 1,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: MetaGameState.initial()
      // Player 1 plays center board, center cell
      .play(MetaPosition(Position(1, 1), Position(1, 1)))
      // Player 2 must play in center board (1,1)
      .play(MetaPosition(Position(1, 1), Position(0, 0)))
      // Player 1 must play in top-left board (0,0)
      .play(MetaPosition(Position(0, 0), Position(1, 1)))
      // Player 2 must play in center board (1,1)
      .play(MetaPosition(Position(1, 1), Position(2, 2)))
      // Player 1 must play in bottom-right board (2,2)
      .play(MetaPosition(Position(2, 2), Position(0, 0)))
      // Player 2 must play in top-left board (0,0)
      .play(MetaPosition(Position(0, 0), Position(0, 0)))
      // Player 1 must play in top-left board (0,0)
      .play(MetaPosition(Position(0, 0), Position(2, 2)))
      // Player 2 must play in bottom-right board (2,2)
      .play(MetaPosition(Position(2, 2), Position(1, 1))),
  startedAt: DateTime.now().subtract(const Duration(minutes: 2, seconds: 15)),
);

final p1WonMetaGame = Game(
  id: 1,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: MetaGameState.initial()
      // Player 1 wins top-left board (0,0)
      .play(MetaPosition(Position(0, 0), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(2, 0)))
      .play(MetaPosition(Position(2, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(0, 2)))
      // Board (0,0) won by Player 1
      // Player 1 wins center board (1,1)
      .play(MetaPosition(Position(0, 2), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(1, 0)))
      .play(MetaPosition(Position(1, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 0)))
      .play(MetaPosition(Position(2, 0), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(1, 0)))
      .play(MetaPosition(Position(1, 0), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(2, 0)))
      .play(MetaPosition(Position(2, 0), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 1)))
      // Board (1,1) won by Player 1
      // Player 1 wins bottom-right board (2,2) for meta victory
      .play(MetaPosition(Position(2, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(1, 2)))
      .play(MetaPosition(Position(1, 2), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 2)))
      .play(MetaPosition(Position(0, 2), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(1, 2)))
      .play(MetaPosition(Position(1, 2), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(2, 0)))
      // Board (2,2) won by Player 1 - Player 1 wins meta game with diagonal (0,0), (1,1), (2,2)
  ,
  startedAt: DateTime.now().subtract(const Duration(minutes: 5, seconds: 30)),
);

final p2WonMetaGame = Game(
  id: 1,
  player1: GamePlayer.user(user, GameCharacter.circle),
  player2: GamePlayer.ai(GameCharacter.robot),
  state: MetaGameState.initial()
      // Player 2 wins top-center board (0,1)
      .play(MetaPosition(Position(0, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(1, 0)))
      .play(MetaPosition(Position(1, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 0)))
      .play(MetaPosition(Position(2, 0), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(2, 0)))
      // Board (0,1) won by Player 2
      // Player 2 wins center board (1,1)
      .play(MetaPosition(Position(2, 0), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(1, 0)))
      .play(MetaPosition(Position(1, 0), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(0, 1)))
      .play(MetaPosition(Position(0, 1), Position(1, 2)))
      .play(MetaPosition(Position(1, 2), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(0, 2)))
      // Board (1,1) won by Player 2
      // Player 2 wins bottom-center board (2,1) for meta victory
      .play(MetaPosition(Position(0, 2), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(1, 0)))
      .play(MetaPosition(Position(1, 0), Position(0, 0)))
      .play(MetaPosition(Position(0, 0), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(1, 1)))
      .play(MetaPosition(Position(1, 1), Position(2, 2)))
      .play(MetaPosition(Position(2, 2), Position(2, 1)))
      .play(MetaPosition(Position(2, 1), Position(1, 0)))
      // Board (2,1) won by Player 2 - Player 2 wins meta game with column (0,1), (1,1), (2,1)
  ,
  startedAt: DateTime.now().subtract(const Duration(minutes: 4, seconds: 45)),
);
