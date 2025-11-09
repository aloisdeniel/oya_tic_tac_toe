import 'package:flutter/material.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              theme.color.main.background.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'User Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      style: FrameStyle.regular,
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
                          // TODO save user
                        }
                      },
                      child: Text('Edit name'),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
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
                        }
                      },
                      child: Text('Change favorite character'),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Preferences',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Sound'),
                      value: true,
                      onChanged: (value) {},
                    ),
                    SwitchListTile(
                      title: const Text('Haptic Feedback'),
                      value: true,
                      onChanged: (value) {},
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
