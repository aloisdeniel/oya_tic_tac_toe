import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/modal_result.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character_picker.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/gradient_page_transition.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt/widgets/header_status.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

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
    PickerResultResultCallback<GameCharacter>? onResult,
  }) {
    return Navigator.push<GameCharacter>(
      context,
      GradientPageRoute(
        pageBuilder: (context, animation, secondaryAnimation) => PickerResult(
          onResult: onResult,
          child: PickCharacterModal(
            status: status,
            title: title,
            subtitle: subtitle,
            background: background,
            character: character,
            characters: characters,
          ),
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
    final l10n = AppLocalizations.of(context)!;
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
          spacing: theme.spacing.medium,
          children: [
            HeaderStatus(child: widget.status),
            Header(
              title: Text(
                widget.title ?? l10n.chooseYourFavoriteCharacter,
                textAlign: TextAlign.center,
              ),
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
            SizedBox(height: theme.spacing.medium),
            SafeArea(
              top: false,
              minimum: EdgeInsets.all(theme.spacing.large),
              child: AppButton(
                onPressed: () {
                  PickerResult.send(context, character);
                },
                style: FrameStyle.primary,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: theme.spacing.regular,
                  ),
                  child: Text(l10n.validate),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
