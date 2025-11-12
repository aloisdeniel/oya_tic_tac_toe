import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/onboarding/widgets/create_user.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/logo.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          minimum: EdgeInsets.all(theme.spacing.xlarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const GlitchingAppLogo(),
              SizedBox(height: theme.spacing.xlarge + 20),
              FadeIn(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Welcome',
                  style: theme.text.header2.copyWith(
                    color: theme.color.main.foreground,
                  ),
                ),
              ),
              SizedBox(height: theme.spacing.medium),
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
                    final user = await createInitialUser(context, ref);

                    if (user != null && context.mounted) context.push('/home');
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
