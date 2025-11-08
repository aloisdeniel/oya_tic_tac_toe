import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character_picker.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class PickCharacterModal extends StatefulWidget {
  const PickCharacterModal({
    super.key,
    this.title,
    this.character = GameCharacter.circle,
  });

  final String? title;
  final GameCharacter character;

  @override
  State<PickCharacterModal> createState() => _PickCharacterScreenState();
}

class _PickCharacterScreenState extends State<PickCharacterModal> {
  late GameCharacter character = widget.character;

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
            Text(
              widget.title ?? 'Choose your favorite character',
              style: theme.text.header2.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CharacterPicker(
                initial: widget.character,
                onChanged: (value) {
                  character = character;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: AppButton(
                onPressed: () {
                  Navigator.pop(context, character);
                },
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
