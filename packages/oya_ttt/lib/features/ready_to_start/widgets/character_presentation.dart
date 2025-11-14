import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class CharacterPresentation extends StatefulWidget {
  const CharacterPresentation({
    super.key,
    required this.character,
    this.direction = AppCharacterDirection.right,
    this.symbolOpacity = 0.15,
  });

  final double symbolOpacity;
  final GameCharacter character;
  final AppCharacterDirection direction;

  @override
  State<CharacterPresentation> createState() => _CharacterPresentationState();
}

class _CharacterPresentationState extends State<CharacterPresentation> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          key: Key('symbol'),
          child: Transform.scale(
            scale: 1.5,
            child: AnimatedGlitch(
              colorDrift: 0.2,
              horizontalShake: 0.1,
              scanLineJitter: 0.25,
              child: Opacity(
                opacity: widget.symbolOpacity,
                child: FittedBox(
                  child: AppCharacterSymbol(character: widget.character),
                ),
              ),
            ),
          ),
        ),
        AppCharacter(
          key: Key('character'),
          direction: widget.direction,
          character: widget.character,
          gradientFromBottom: [
            theme.color.accents(widget.character).foreground,
            theme.color
                .accents(widget.character)
                .foreground
                .withValues(alpha: 0),
          ],
        ),
      ],
    );
  }
}
