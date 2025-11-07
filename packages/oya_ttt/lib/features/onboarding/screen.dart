import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';

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
              Text(
                'Welcome',
                style: theme.text.header2.copyWith(
                  color: theme.color.main.foreground,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Tic Tac Toe Game',
                style: theme.text.body.copyWith(
                  color: theme.color.main.foregroundSecondary,
                ),
              ),
              const Spacer(),
              AppButton(
                style: FrameStyle.highlight,
                onPressed: () => context.push('/create-user'),
                child: const Text('START'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
