import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

/// Provider that returns the current user's ID from shared preferences.
///
/// Returns null if no user is currently selected.
final $userId = FutureProvider((ref) {
  final prefs = ref.watch($sharedPreferences);
  return prefs.getInt('current_user_id');
});

/// Provider that returns the current user object.
///
/// Looks up the user in the users list by the current user ID.
/// Returns null if there is no current user or the user is not found.
final $user = FutureProvider<User?>((ref) async {
  final userId = await ref.watch($userId.future);
  if (userId == null) return null;
  final users = await ref.watch($users.future);
  return users.where((x) => x.id == userId).firstOrNull;
});

/// Provider for the list of all users in the application.
///
/// This provider manages user creation, updates, and selection.
final $users = AsyncNotifierProvider(UsersNotifier.new);

/// Notifier that manages the list of users.
///
/// This notifier handles:
/// - Loading all users from the database
/// - Setting the current user
/// - Creating new users
/// - Updating existing user information
class UsersNotifier extends AsyncNotifier<List<User>> {
  /// Logger instance for this notifier.
  final Logger logger = Logger('UsersNotifier');

  /// Builds the initial state by loading all users from the database.
  ///
  /// Returns a list of all users stored in the database.
  @override
  Future<List<User>> build() async {
    final db = ref.watch($database);
    return db.loadAllUsers();
  }

  /// Sets the current user by storing his [userId] in shared preferences.
  ///
  /// After setting the user, the $userId provider is invalidated to
  /// trigger updates in any watching widgets.
  Future<void> setCurrentUser(int userId) async {
    final prefs = ref.watch($sharedPreferences);
    await prefs.setInt('current_user_id', userId);
    ref.invalidate($userId);
    logger.info('Current user is now $userId');
  }

  /// Creates a new user with the specified [name] and [favoriteCharacter].
  ///
  /// Returns the newly created [User] instance.
  /// The user is persisted to the database and added to the state.
  Future<User> createUser({
    required String name,
    GameCharacter favoriteCharacter = GameCharacter.circle,
  }) async {
    late User newUser;
    try {
      final db = ref.watch($database);

      final newUserId = await db.createUser(
        name: name,
        favoriteCharacter: favoriteCharacter,
      );

      newUser = User(
        id: newUserId,
        name: name,
        favoriteCharacter: favoriteCharacter,
      );
    } catch (e, st) {
      logger.severe('Failed to save to database', e, st);
      newUser = User(
        id: DateTime.now().millisecondsSinceEpoch,
        name: name,
        favoriteCharacter: favoriteCharacter,
      );
    }

    if (state case AsyncData(:final value)) {
      state = AsyncData([...value, newUser]);
    } else {
      ref.invalidateSelf(asReload: true);
    }

    logger.info('Created user ${newUser.id}');

    return newUser;
  }

  /// Updates an existing user's information.
  ///
  /// Parameters:
  /// - [userId]: The ID of the user to update
  /// - [name]: The new name (optional, null to keep current)
  /// - [favoriteCharacter]: The new favorite character (optional, null to keep current)
  ///
  /// The updated user information is persisted to the database and
  /// the state is updated to reflect the changes.
  Future<void> updateUser({
    required int userId,
    String? name,
    GameCharacter? favoriteCharacter,
  }) async {
    try {
      final db = ref.watch($database);
      db.updateUser(
        userId: userId,
        name: name,
        favoriteCharacter: favoriteCharacter,
      );
    } catch (e, st) {
      logger.severe('Failed to update the database', e, st);
    }

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
