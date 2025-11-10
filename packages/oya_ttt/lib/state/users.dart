import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

final $userId = FutureProvider((ref) {
  final prefs = ref.watch($sharedPreferences);
  return prefs.getInt('current_user_id');
});

final $user = FutureProvider<User?>((ref) async {
  final userId = await ref.watch($userId.future);
  if (userId == null) return null;
  final users = await ref.watch($users.future);
  return users.where((x) => x.id == userId).firstOrNull;
});

final $users = AsyncNotifierProvider(UsersNotifier.new);

class UsersNotifier extends AsyncNotifier<List<User>> {
  final Logger logger = Logger('UsersNotifier');

  @override
  Future<List<User>> build() async {
    final db = ref.watch($database);
    return db.loadAllUsers();
  }

  Future<void> setCurrentUser(int userId) async {
    final prefs = ref.watch($sharedPreferences);
    await prefs.setInt('current_user_id', userId);
    ref.invalidate($userId);
    logger.info('Current user is now $userId');
  }

  Future<User> createUser({
    required String name,
    GameCharacter favoriteCharacter = GameCharacter.circle,
  }) async {
    final db = ref.watch($database);

    final newUserId = await db.createUser(
      name: name,
      favoriteCharacter: favoriteCharacter,
    );

    final newUser = User(
      id: newUserId,
      name: name,
      favoriteCharacter: favoriteCharacter,
    );

    if (state case AsyncData(:final value)) {
      state = AsyncData([...value, newUser]);
    } else {
      ref.invalidateSelf(asReload: true);
    }

    logger.info('Created user ${newUser.id}');

    return newUser;
  }

  Future<void> updateUser({
    required int userId,
    String? name,
    GameCharacter? favoriteCharacter,
  }) async {
    final db = ref.watch($database);
    db.updateUser(
      userId: userId,
      name: name,
      favoriteCharacter: favoriteCharacter,
    );

    if (state case AsyncData(:final value)) {
      state = AsyncData([
        for (final user in value)
          if (user.id == userId)
            User(
              id: user.id,
              name: name ?? user.name,
              favoriteCharacter: favoriteCharacter ?? user.favoriteCharacter,
            )
          else
            user,
      ]);
    } else {
      ref.invalidateSelf(asReload: true);
    }

    logger.info('Updated user $userId');
  }
}
