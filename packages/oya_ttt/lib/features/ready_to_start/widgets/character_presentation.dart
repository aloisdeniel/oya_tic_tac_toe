import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class CharacterPresentation extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Transform.scale(
            scale: 1.5,
            child: AnimatedGlitch(
              colorDrift: 0.2,
              horizontalShake: 0.1,
              scanLineJitter: 0.25,
              child: Opacity(
                opacity: symbolOpacity,
                child: FittedBox(
                  child: FadeIn(
                    delay: const Duration(milliseconds: 300),
                    child: AppCharacterSymbol(character: character),
                  ),
                ),
              ),
            ),
          ),
        ),
        FadeIn(
          child: AppCharacter(
            direction: direction,
            character: character,
            gradientFromBottom: [
              theme.color.accents(character).foreground,
              theme.color.accents(character).foreground.withValues(alpha: 0),
            ],
          ),
        ),
      ],
    );
  }
}
