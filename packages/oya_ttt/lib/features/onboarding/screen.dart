import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Background.city2(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.3),
              theme.color.main.background.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const GlitchingAppLogo(),
              const SizedBox(height: 80),
              FadeIn(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Welcome',
                  style: theme.text.header2.copyWith(
                    color: theme.color.main.foreground,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeIn(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  'Tic Tac Toe Game',
                  style: theme.text.body.copyWith(
                    color: theme.color.main.foregroundSecondary,
                  ),
                ),
              ),
              const Spacer(),
              FadeIn(
                delay: const Duration(milliseconds: 800),
                child: AppButton(
                  style: FrameStyle.primary,
                  onPressed: () async {
                    final name = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditUserModal();
                        },
                      ),
                    );
                    if (name != null && context.mounted) {
                      final character = await Navigator.push<GameCharacter>(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PickCharacterModal();
                          },
                        ),
                      );
                      if (character != null && context.mounted) {
                        // TODO save user
                        context.push('/home');
                      }
                    }
                  },
                  child: const Text('START'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
