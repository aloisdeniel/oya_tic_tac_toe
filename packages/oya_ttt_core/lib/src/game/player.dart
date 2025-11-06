import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/src/game/character.dart';
import 'package:oya_ttt_core/src/user.dart';

part 'player.mapper.dart';

@MappableEnum()
enum GamePlayerId {
  player1,
  player2;

  GamePlayerId get other => switch (this) {
    player1 => player2,
    player2 => player1,
  };
}

@MappableClass()
class GamePlayer with GamePlayerMappable {
  const GamePlayer({required this.user, required this.character});
  const GamePlayer.user(User this.user, this.character);
  const GamePlayer.ai(this.character) : user = null;

  final GameCharacter character;
  final User? user;
  bool get isAI => user == null;
}
