import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    super.key,
    required this.game,
    required this.board,
    required this.onPlay,
  });

  final Game game;
  final Board board;
  final ValueChanged<Position> onPlay;

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
          final value = board.at(position);
          final player = value == null ? null : game.player(value);
          return GestureDetector(
            onTap: () => onPlay(position),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.color.main.foreground),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: switch (player) {
                  GamePlayer() => AppCharacterSymbol(
                    character: player.character,
                  ),
                  null => const SizedBox(),
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
