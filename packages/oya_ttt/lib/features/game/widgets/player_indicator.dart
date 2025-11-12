import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

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
    final layout = Responsive.of(context);
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
          padding: EdgeInsets.all(theme.spacing.small),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: switch (layout) {
                  LayoutMode.regular => 54,
                  LayoutMode.small => 36,
                },
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
                          child: Text(
                            switch (player.user) {
                              User user => user.name,
                              null => AppLocalizations.of(context)!.computer,
                            },
                            style: theme.text.button.copyWith(
                              color: accent.foreground,
                            ),
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
