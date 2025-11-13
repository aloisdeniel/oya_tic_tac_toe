import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt/state/users.dart';

class UserSettings {
  const UserSettings({
    required this.hapticFeedback,
    required this.disableVisualEffects,
  });
  final bool hapticFeedback;
  final bool disableVisualEffects;

  UserSettings copyWith({bool? hapticFeedback, bool? disableVisualEffects}) {
    return UserSettings(
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      disableVisualEffects: disableVisualEffects ?? this.disableVisualEffects,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final otherSettings = other as UserSettings;
    return hapticFeedback == otherSettings.hapticFeedback &&
        disableVisualEffects == otherSettings.disableVisualEffects;
  }

  @override
  int get hashCode {
    return Object.hash(hapticFeedback, disableVisualEffects);
  }

  @override
  String toString() {
    return 'UserSettings(hapticFeedback: $hapticFeedback, disableVisualEffects: $disableVisualEffects)';
  }
}

/// Provider that returns the current user's settings from shared preferences.
///
/// This provider manages user-specific settings like haptic feedback and visual effects.
final $userSettings = AsyncNotifierProvider<UserSettingsNotifier, UserSettings>(
  UserSettingsNotifier.new,
);

final $disableVisualEffectsSetting = Provider<bool>((ref) {
  final settings = ref.watch($userSettings);
  return settings.value?.disableVisualEffects ?? false;
});

final $hapticFeedbackSetting = Provider<bool>((ref) {
  final settings = ref.watch($userSettings);
  return settings.value?.hapticFeedback ?? true;
});

/// Notifier that manages user settings stored in shared preferences.
///
/// Settings are stored per-user using the key pattern: 'user_settings_{userId}'
class UserSettingsNotifier extends AsyncNotifier<UserSettings> {
  /// Logger instance for this notifier.
  final Logger logger = Logger('UserSettingsNotifier');

  /// Builds the initial state by loading settings from shared preferences.
  ///
  /// Returns the user's settings or default values if none are stored.
  @override
  Future<UserSettings> build() async {
    final userId = await ref.watch($userId.future);
    if (userId == null) {
      // Return default settings if no user is logged in
      return const UserSettings(
        hapticFeedback: true,
        disableVisualEffects: false,
      );
    }

    final prefs = ref.watch($sharedPreferences);
    final hapticFeedback =
        await prefs.getBool('user_settings_${userId}_haptic') ?? true;
    final disableVisualEffects =
        await prefs.getBool('user_settings_${userId}_visual') ?? false;

    return UserSettings(
      hapticFeedback: hapticFeedback,
      disableVisualEffects: disableVisualEffects,
    );
  }

  /// Updates the haptic feedback setting for the current user.
  Future<void> setHapticFeedback(bool enabled) async {
    final userId = await ref.read($userId.future);
    if (userId == null) return;

    final prefs = ref.read($sharedPreferences);
    await prefs.setBool('user_settings_${userId}_haptic', enabled);

    if (state case AsyncData(:final value)) {
      state = AsyncData(value.copyWith(hapticFeedback: enabled));
    }

    logger.info('Updated haptic feedback for user $userId: $enabled');
  }

  /// Updates the visual effects setting for the current user.
  Future<void> setDisableVisualEffects(bool disabled) async {
    final userId = await ref.read($userId.future);
    if (userId == null) return;

    final prefs = ref.read($sharedPreferences);
    await prefs.setBool('user_settings_${userId}_visual', disabled);

    if (state case AsyncData(:final value)) {
      state = AsyncData(value.copyWith(disableVisualEffects: disabled));
    }

    logger.info('Updated visual effects for user $userId: disabled=$disabled');
  }
}
