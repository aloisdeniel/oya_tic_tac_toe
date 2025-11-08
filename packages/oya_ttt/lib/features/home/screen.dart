import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/home/new_game.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/features/pick_user/user_tile.dart';
import 'package:oya_ttt/features/ready_to_start/screen.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

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
                      const SizedBox(height: 60),
                      const NewGameButton(),
                      const SizedBox(height: 20),
                      const StatsButton(),
                      const SizedBox(height: 20),
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
              padding: const EdgeInsets.all(48.0),
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
                        const SizedBox(height: 60),
                        const NewGameButton(),
                        const SizedBox(height: 20),
                        const StatsButton(),
                        const SizedBox(height: 20),
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

class NewGameButton extends StatelessWidget {
  const NewGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () async {
        final user = User(
          id: 0,
          name: 'John',
          favoriteCharacter: GameCharacter.cross,
        );
        final game = await showNewGame(context, user);
        if (game != null && context.mounted) {
          final resultGame = await ReadyToStartModal.show(context, game: game);
          if (resultGame != null && context.mounted) {
            context.push('/game?id=${resultGame.id}');
          }
        }
      },
      style: FrameStyle.primary,
      child: Text('NEW GAME', style: TextStyle(fontSize: 18)),
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
      child: Text('STATISTICS', style: TextStyle(fontSize: 18)),
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
      child: Text('SETTINGS', style: TextStyle(fontSize: 18)),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(
      id: 0,
      name: 'John',
      favoriteCharacter: GameCharacter.cross,
    );
    return UserTile(
      direction: TextDirection.rtl,
      user: user,

      onTap: () async {
        final newUser = await PickUserModal.show(
          context,
          filter: (other) => other.id != user.id,
        );
      },
    );
  }
}
