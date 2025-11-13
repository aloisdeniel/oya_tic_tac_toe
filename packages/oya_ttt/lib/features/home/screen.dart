import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/home/widgets/new_game.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/features/pick_user/widgets/user_tile.dart';
import 'package:oya_ttt/features/ready_to_start/screen.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Background.room(
      child: Responsive(
        small: (context) {
          return DecoratedBox(
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
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const GlitchingAppLogo(),
                      SizedBox(height: theme.spacing.xlarge),
                      const NewGameButton(),
                      SizedBox(height: theme.spacing.medium),
                      const StatsButton(),
                      SizedBox(height: theme.spacing.medium),
                      const SettingsButton(),
                    ],
                  ),
                ),
                Positioned(top: 40, right: 20, child: const ProfileButton()),
              ],
            ),
          );
        },
        regular: (context) {
          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  theme.color.main.background.withValues(alpha: 1),
                  theme.color.main.background.withValues(alpha: 0.6),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(theme.spacing.large),
              child: Stack(
                children: [
                  Positioned(top: 0, left: 0, child: GlitchingAppLogo()),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: theme.spacing.xlarge),
                        const NewGameButton(),
                        SizedBox(height: theme.spacing.medium),
                        const StatsButton(),
                        SizedBox(height: theme.spacing.medium),
                        const SettingsButton(),
                      ],
                    ),
                  ),
                  Positioned(top: 40, right: 20, child: const ProfileButton()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewGameButton extends ConsumerWidget {
  const NewGameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      onPressed: () async {
        final game = await showNewGame(context, ref);
        if (game != null && context.mounted) {
          final resultGame = await ReadyToStartModal.show(context, game: game);
          if (resultGame != null && context.mounted) {
            context.push('/game?id=${resultGame.id}');
          }
        }
      },
      style: FrameStyle.primary,
      child: Text(
        AppLocalizations.of(context)!.newGame,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class StatsButton extends StatelessWidget {
  const StatsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => context.push('/statistics'),
      style: FrameStyle.regular,
      child: Text(
        AppLocalizations.of(context)!.statistics,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => context.push('/settings'),
      style: FrameStyle.regular,
      child: Text(
        AppLocalizations.of(context)!.settings,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ProfileButton extends ConsumerWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch($user).value;
    if (user == null) return const SizedBox();
    return UserTile(
      direction: AppCharacterDirection.left,
      user: user,

      onTap: () async {
        final newUser = await PickUserModal.show(
          context,
          status: Text(AppLocalizations.of(context)!.changeUser),
          filter: (other) => other.id != user.id,
        );
        if (newUser case PickUserHumanResult(:final user)) {
          ref.read($users.notifier).setCurrentUser(user.id);
        }
      },
    );
  }
}
