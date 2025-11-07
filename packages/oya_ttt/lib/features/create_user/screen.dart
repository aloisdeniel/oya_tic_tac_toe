import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character_picker.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Background.room2(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            const SizedBox(height: 48),
            Material(
              color: Colors.transparent,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose your favorite character',
              style: theme.text.header2.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CharacterPicker(
                initial: GameCharacter.circle,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: AppButton(
                onPressed: () => context.go('/home'),
                style: FrameStyle.regular,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Text('Validate'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
