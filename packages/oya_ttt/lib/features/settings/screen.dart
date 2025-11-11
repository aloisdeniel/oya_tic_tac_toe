import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/settings/widgets/update_character.dart';
import 'package:oya_ttt/features/settings/widgets/update_name.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/header.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
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
          child: Column(
            children: [
              Header(title: Text('User settings')),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
                        updateUserName(context, ref);
                      },
                      child: Text('Edit name'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
                        updateUserCharacter(context, ref);
                      },
                      child: Text('Change favorite character'),
                    ),
                  ],
                ),
              ),

              AppButton(
                style: FrameStyle.regular,
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text('BACK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
