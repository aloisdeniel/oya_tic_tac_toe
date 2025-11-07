import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/glitch.dart';
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
                      Logo(),
                      const SizedBox(height: 60),
                      const NewGameButton(),
                      const SizedBox(height: 20),
                      const StatsButton(),
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
                  Positioned(top: 0, left: 0, child: Logo()),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        const NewGameButton(),
                        const SizedBox(height: 20),
                        const StatsButton(),
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

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return AnimatedGlitch(
      scanLineJitter: 0.3,
      verticalJump: 0,
      horizontalShake: 0.02,
      colorDrift: 0.1,
      child: AppLogo(color: theme.color.main.foreground),
    );
  }
}

class NewGameButton extends StatelessWidget {
  const NewGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () => context.push('/pick-mode'),
      style: FrameStyle.highlight,
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

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: () => context.push('/settings'),
      style: FrameStyle.regular,
      child: Row(
        children: [
          Text('John', style: theme.text.button),
          const SizedBox(width: 10),
          SizedBox.square(
            dimension: 92,
            child: AppCharacterAvatar(
              direction: AppCharacterDirection.left,
              character: GameCharacter.cross,
            ),
          ),
        ],
      ),
    );
  }
}
