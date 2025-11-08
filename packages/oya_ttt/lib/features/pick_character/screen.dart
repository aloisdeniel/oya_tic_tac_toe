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
    this.characters = GameCharacter.values,
    this.background = BackgroundIllustration.room2,
  });

  static Future<GameCharacter?> show(
    BuildContext context, {
    required GameCharacter character,
    List<GameCharacter> characters = GameCharacter.values,
    String? title,
    BackgroundIllustration background = BackgroundIllustration.room2,
  }) {
    return Navigator.push<GameCharacter>(
      context,
      MaterialPageRoute(
        builder: (context) => PickCharacterModal(
          title: title,
          background: background,
          character: character,
          characters: characters,
        ),
      ),
    );
  }

  final String? title;
  final GameCharacter character;
  final List<GameCharacter> characters;
  final BackgroundIllustration background;

  @override
  State<PickCharacterModal> createState() => _PickCharacterScreenState();
}

class _PickCharacterScreenState extends State<PickCharacterModal> {
  late GameCharacter character = widget.character;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Background(
      illustration: widget.background,
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
                characters: widget.characters,
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
