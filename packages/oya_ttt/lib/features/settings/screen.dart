import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/settings/widgets/setting_tile.dart';
import 'package:oya_ttt/features/settings/widgets/update_character.dart';
import 'package:oya_ttt/features/settings/widgets/update_name.dart';
import 'package:oya_ttt/state/settings.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/frame.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/widgets/toggle_input.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final userSettings = ref.watch($userSettings);
    final user = ref.watch($user);

    return Background.room2(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Header(title: Text(l10n.userSettings)),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(theme.spacing.regular),
                      children: [
                        SettingTile(
                          label: l10n.character,
                          value: AppButton(
                            style: FrameStyle.regular,
                            onPressed: () async {
                              updateUserName(context, ref);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: theme.spacing.regular,
                              children: [
                                AppCharacterAvatar(
                                  character:
                                      user.value?.favoriteCharacter ??
                                      GameCharacter.circle,
                                  size: 50,
                                ),
                                Icon(Icons.edit, size: 20),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: theme.spacing.regular),
                        SettingTile(
                          label: l10n.name,
                          value: AppButton(
                            style: FrameStyle.regular,
                            onPressed: () async {
                              updateUserCharacter(context, ref);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: theme.spacing.regular,
                              children: [
                                Text(user.value?.name ?? ''),
                                Icon(Icons.edit, size: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: theme.spacing.regular),

                        // Haptic Feedback Setting
                        userSettings.when(
                          data: (settings) => SettingTile(
                            label: l10n.hapticFeedback,
                            value: ToggleInput(
                              value: settings.hapticFeedback,
                              onChanged: (value) {
                                ref
                                    .read($userSettings.notifier)
                                    .setHapticFeedback(value);
                              },
                            ),
                          ),
                          loading: () => DefaultFrameStyle(
                            style: FrameStyle.regular,
                            padding: EdgeInsets.symmetric(
                              horizontal: theme.spacing.regular,
                              vertical: theme.spacing.small,
                            ),
                            child: Frame(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(l10n.hapticFeedback),
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                        SizedBox(height: theme.spacing.regular),

                        // Disable Visual Effects Setting
                        userSettings.when(
                          data: (settings) => DefaultFrameStyle(
                            style: FrameStyle.regular,
                            padding: EdgeInsets.symmetric(
                              horizontal: theme.spacing.regular,
                              vertical: theme.spacing.small,
                            ),
                            child: Frame(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(l10n.disableVisualEffects),
                                  ToggleInput(
                                    value: settings.disableVisualEffects,
                                    onChanged: (value) {
                                      ref
                                          .read($userSettings.notifier)
                                          .setDisableVisualEffects(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          loading: () => DefaultFrameStyle(
                            style: FrameStyle.regular,
                            padding: EdgeInsets.symmetric(
                              horizontal: theme.spacing.regular,
                              vertical: theme.spacing.small,
                            ),
                            child: Frame(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(l10n.disableVisualEffects),
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),

                  SafeArea(
                    top: false,
                    minimum: EdgeInsets.all(theme.spacing.large),
                    child: AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Text(l10n.back),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
