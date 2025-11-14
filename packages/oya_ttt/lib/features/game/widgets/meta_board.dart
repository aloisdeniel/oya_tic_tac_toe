import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/base/pointer_area.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

/// Widget that displays the meta tic-tac-toe game board
class MetaBoardView extends StatelessWidget {
  const MetaBoardView({
    super.key,
    required this.game,
    required this.state,
    required this.onCellTapped,
  });

  final Game game;
  final MetaGameState state;
  final ValueChanged<MetaPosition> onCellTapped;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.all(theme.spacing.regular),
          child: Column(
            spacing: theme.spacing.regular,
            children: [
              for (var metaRow = 0; metaRow < 3; metaRow++)
                Expanded(
                  child: Row(
                    spacing: theme.spacing.regular,
                    children: [
                      for (var metaCol = 0; metaCol < 3; metaCol++)
                        Expanded(
                          child: _SmallBoard(
                            game: game,
                            state: state,
                            boardPosition: Position(metaRow, metaCol),
                            onCellTapped: onCellTapped,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget that displays a single small 3x3 board in the meta game
class _SmallBoard extends StatelessWidget {
  const _SmallBoard({
    required this.game,
    required this.state,
    required this.boardPosition,
    required this.onCellTapped,
  });

  final Game game;
  final MetaGameState state;
  final Position boardPosition;
  final ValueChanged<MetaPosition> onCellTapped;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final metaCell = state.metaBoard.at(boardPosition);
    final isActive =
        state.activeBoard == null || state.activeBoard == boardPosition;
    final isBoardWon = metaCell != null;

    // If board is won, show the winner's character overlaid
    if (isBoardWon) {
      final winner = game.player(metaCell);
      return AnimatedGlitch(
        scanLineJitter: 0.1,
        colorDrift: 0.02,
        child: Container(
          decoration: BoxDecoration(
            color: theme.color
                .accents(winner.character)
                .foreground
                .withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(1),
            border: Border.all(
              color: theme.color.accents(winner.character).foreground,
              width: 2,
            ),
          ),
          child: Center(
            child: AppCharacterSymbol(
              character: winner.character,
              color: theme.color.accents(winner.character).foreground,
              size: 60,
            ),
          ),
        ),
      );
    }

    // Otherwise, show the individual cells
    return Container(
      decoration: BoxDecoration(
        color: theme.color.main.background.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(1),
        border: Border.all(
          color: isActive
              ? theme.color.main.foreground.withValues(alpha: 0.5)
              : theme.color.main.foreground.withValues(alpha: 0.1),
          width: isActive ? 2 : 1,
        ),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          for (var cellRow = 0; cellRow < 3; cellRow++)
            for (var cellCol = 0; cellCol < 3; cellCol++)
              _MetaCell(
                game: game,
                state: state,
                metaPosition: MetaPosition(
                  boardPosition,
                  Position(cellRow, cellCol),
                ),
                onTap: onCellTapped,
                isActive: isActive,
              ),
        ],
      ),
    );
  }
}

/// Widget that displays a single cell in a small board
class _MetaCell extends StatelessWidget {
  const _MetaCell({
    required this.game,
    required this.state,
    required this.metaPosition,
    required this.onTap,
    required this.isActive,
  });

  final Game game;
  final MetaGameState state;
  final MetaPosition metaPosition;
  final ValueChanged<MetaPosition> onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final cellPlayerId = state.boards[metaPosition.boardPos]!.at(
      metaPosition.cellPos,
    );
    final player = cellPlayerId != null ? game.player(cellPlayerId) : null;

    if (player != null) {
      // Cell is occupied - show the player's character
      return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            color: theme.color.accents(player.character).foreground,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: AppCharacterSymbol(
              character: player.character,
              color: theme.color.main.foreground,
              size: 12,
            ),
          ),
        ),
      );
    }

    // Cell is empty
    if (!isActive || state.isOver) {
      // Board is not active or game is over - show empty cell
      return Container(
        decoration: BoxDecoration(
          color: theme.color.main.background.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }

    // Board is active and cell is empty - make it interactive
    final nextPlayer = game.player(state.nextPlayer);
    final isHumanPlayer = !nextPlayer.isAI;

    return PointerArea(
      onTap: isHumanPlayer ? () => onTap(metaPosition) : null,
      builder: (context, pointerState, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: switch (pointerState) {
          PointerState(isHovering: true) when isHumanPlayer => Container(
            decoration: BoxDecoration(
              color: theme.color
                  .accents(nextPlayer.character)
                  .foreground
                  .withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: AppCharacterSymbol(
                character: nextPlayer.character,
                color: theme.color
                    .accents(nextPlayer.character)
                    .foreground
                    .withValues(alpha: 0.5),
                size: 12,
              ),
            ),
          ),
          _ => Container(
            decoration: BoxDecoration(
              color: theme.color.main.background.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        },
      ),
    );
  }
}
