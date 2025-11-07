import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Background.room(
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
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLogo(color: theme.color.main.foreground),
                  const SizedBox(height: 60),
                  AppButton(
                    onPressed: () => context.push('/pick-mode'),
                    style: FrameStyle.highlight,
                    child: Text('NEW GAME', style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: () => context.push('/statistics'),
                    style: FrameStyle.regular,
                    child: Text('STATISTICS', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: AppButton(
                onPressed: () => context.push('/settings'),
                style: FrameStyle.regular,
                child: Row(
                  children: [
                    Text('John', style: theme.text.button),
                    const SizedBox(width: 10),
                    SizedBox.square(
                      dimension: 92,
                      child: AppCharacterAvatar(character: GameCharacter.cross),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
