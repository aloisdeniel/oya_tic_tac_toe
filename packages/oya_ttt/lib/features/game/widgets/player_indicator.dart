import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GamePlayerIndicator extends StatelessWidget {
  const GamePlayerIndicator({
    super.key,
    required this.isActive,
    required this.player,
    required this.direction,
  });

  final bool isActive;
  final GamePlayer player;
  final AppCharacterDirection direction;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final accent = theme.color.accents(player.character);
    final right = direction == AppCharacterDirection.right;
    return Directionality(
      textDirection: direction.toTextDirection(),
      child: DiagonalDecorated(
        end: right,
        start: !right,
        color: isActive
            ? theme.color.highlight.background
            : theme.color.main.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 62,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isActive ? 1 : 0.5,
                  child: AppCharacterAvatar(
                    direction: direction,
                    character: player.character,
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutQuad,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  switchInCurve: Curves.easeInOutQuad,
                  child: isActive
                      ? Padding(
                          padding: const EdgeInsetsGeometry.directional(
                            start: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                switch (player.user) {
                                  User user => user.name,
                                  null => 'Computer',
                                },
                                style: theme.text.button.copyWith(
                                  color: accent.foreground,
                                ),
                              ),

                              Text(
                                'Player',
                                style: theme.text.footnote.copyWith(
                                  color: accent.foreground,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(height: theme.text.button.fontSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
