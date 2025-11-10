import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameMiniBoard extends StatelessWidget {
  const GameMiniBoard({super.key, required this.game, required this.state});

  final Game game;
  final BasicGameState state;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final position = Position.fromIndex(index);
          final playerId = state.board.at(position);
          if (playerId == null) {
            return Container(
              decoration: BoxDecoration(
                color: theme.color.main.foreground.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }
          final player = game.player(playerId);
          final accent = theme.color.accents(player.character);
          return Container(
            decoration: BoxDecoration(
              color: accent.backgroundSubtle,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: AppCharacterSymbol(
                character: player.character,
                color: accent.foreground,
              ),
            ),
          );
        },
      ),
    );
  }
}
