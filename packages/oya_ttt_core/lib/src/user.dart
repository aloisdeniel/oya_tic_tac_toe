import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  const User({
    required this.id,
    required this.name,
    required this.favoriteCharacter,
  });

  final int id;
  final String name;
  final GameCharacter favoriteCharacter;
}

@MappableClass()
class UserStats with UserStatsMappable {
  const UserStats({
    required this.wonGames,
    required this.lostGames,
    required this.lastGames,
  });

  final int wonGames;
  final int lostGames;
  final List<UserGameStats> lastGames;
}

@MappableClass()
class UserGameStats with UserGameStatsMappable {
  const UserGameStats({
    required this.gameId,
    required this.endedAt,
    required this.mode,
    required this.opponent,
    required this.won,
  });

  final int gameId;
  final DateTime endedAt;
  final GameMode mode;
  final User? opponent;
  final bool won;
}
