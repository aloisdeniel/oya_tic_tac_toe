import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameMiniBoard extends StatelessWidget {
  const GameMiniBoard({
    super.key,
    required this.game,
    required this.board,
    this.spacing,
  });

  final Game game;
  final Board board;
  final double? spacing;

  Widget buildCell(context, int row, int column) {
    final theme = AppTheme.of(context);
    final position = Position(row, column);
    final playerId = board.at(position);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: () {
        if (playerId == null) {
          return Container(
            key: Key('not_played'),
            decoration: BoxDecoration(
              color: theme.color.main.foreground.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(1),
            ),
          );
        }
        final player = game.player(playerId);
        final accent = theme.color.accents(player.character);
        return Container(
          key: Key('played'),
          decoration: BoxDecoration(
            color: accent.backgroundSubtle,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Center(
            child: AppCharacterSymbol(
              character: player.character,
              color: accent.foreground,
            ),
          ),
        );
      }(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        spacing: spacing ?? theme.spacing.small,
        children: [
          for (var r = 0; r < 3; r++)
            Expanded(
              child: Row(
                spacing: spacing ?? theme.spacing.small,
                children: [
                  for (var c = 0; c < 3; c++)
                    Expanded(child: buildCell(context, r, c)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
