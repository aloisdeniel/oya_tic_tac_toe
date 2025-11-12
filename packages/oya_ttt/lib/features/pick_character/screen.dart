import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character_picker.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt/widgets/header_status.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class PickCharacterModal extends StatefulWidget {
  const PickCharacterModal({
    super.key,
    this.title,
    required this.status,
    this.subtitle,
    this.character = GameCharacter.circle,
    this.characters = GameCharacter.values,
    this.background = BackgroundIllustration.room2,
  });

  static Future<GameCharacter?> show(
    BuildContext context, {
    required Widget status,
    required GameCharacter character,
    List<GameCharacter> characters = GameCharacter.values,
    String? title,
    Widget? subtitle,
    BackgroundIllustration background = BackgroundIllustration.room2,
  }) {
    return Navigator.push<GameCharacter>(
      context,
      MaterialPageRoute(
        builder: (context) => PickCharacterModal(
          status: status,
          title: title,
          subtitle: subtitle,
          background: background,
          character: character,
          characters: characters,
        ),
      ),
    );
  }

  final Widget status;
  final String? title;
  final Widget? subtitle;
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
              theme.color.main.background.withValues(alpha: 0.42),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            HeaderStatus(child: widget.status),
            Header(
              title: Text(widget.title ?? 'Choose your favorite character'),
              subtitle: widget.subtitle,
            ),
            Expanded(
              child: CharacterPicker(
                initial: widget.character,
                characters: widget.characters
                    .where((x) => x != GameCharacter.robot)
                    .toList(),
                onChanged: (value) {
                  character = value;
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
