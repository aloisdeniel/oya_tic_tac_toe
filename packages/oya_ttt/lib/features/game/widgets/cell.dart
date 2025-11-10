import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/base/pointer_area.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class BoardCell extends ConsumerWidget {
  const BoardCell({
    super.key,
    required this.onTap,
    required this.position,
    required this.player,
  });

  final Position position;
  final GamePlayer? player;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final nextCharacter = ref.watch($nextPlayerCharacter);
    return switch (player) {
      GamePlayer(:final character) => FadeIn(
        duration: const Duration(milliseconds: 700),
        child: AnimatedGlitch(
          scanLineJitter: 0.6,
          colorDrift: 0.1,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: theme.color.accents(character).foreground,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Center(
                child: AppCharacterSymbol(
                  character: character,
                  color: theme.color.main.foreground,
                  size: 80,
                ),
              ),
            ],
          ),
        ),
      ),
      _ => PointerArea(
        onTap: onTap,
        builder: (context, state, _) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: switch (state) {
            PointerState(isHovering: true) => Container(
              color: theme.color.main.background,
              child: Center(
                child: AppCharacterSymbol(
                  character: nextCharacter ?? GameCharacter.circle,
                  color: theme.color
                      .accents(nextCharacter ?? GameCharacter.circle)
                      .foreground
                      .withValues(alpha: 0.25),
                  size: 70,
                ),
              ),
            ),
            _ => Container(color: theme.color.main.background),
          },
        ),
      ),
    };
  }
}
