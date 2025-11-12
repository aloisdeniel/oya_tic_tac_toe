import 'package:flutter/material.dart';
import 'package:oya_ttt/features/game/widgets/cell.dart';
import 'package:oya_ttt/features/game/widgets/glow.dart';
import 'package:oya_ttt/features/game/widgets/screens.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/base/transparent_image.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    super.key,
    required this.game,
    required this.board,
    required this.onCellTapped,
  });

  final Game game;
  final Board board;
  final ValueChanged<Position> onCellTapped;

  @override
  Widget build(BuildContext context) {
    Widget cell(int i) {
      final position = Position.fromIndex(i);
      final playerId = board.at(position);
      final player = playerId == null ? null : game.player(playerId);
      return BoardCell(
        onTap: () => onCellTapped(position),
        position: position,
        player: player,
      );
    }

    const asset = 'assets/background/screens.png';
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox.fromSize(
        size: screensIllustrationSize,
        child: Stack(
          children: [
            for (var i = 0; i < screenCoordinates.length; i++)
              Positioned.fromRect(
                key: Key('cell_$i'),
                rect: screenCoordinates[i],
                child: FadeIn(
                  delay: const Duration(seconds: 1),
                  child: cell(i),
                ),
              ),
            Positioned.fill(
              key: Key('shadow'),
              child: IgnorePointer(child: ScreensShadow()),
            ),
            Positioned.fill(
              key: Key('bg'),
              child: IgnorePointer(
                child: FadeInImage(
                  image: AssetImage(asset),
                  fit: BoxFit.contain,
                  placeholder: transparentImage,
                ),
              ),
            ),
            Positioned.fill(
              key: Key('glow'),
              child: IgnorePointer(
                child: ScreensGlow(game: game, board: board),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
