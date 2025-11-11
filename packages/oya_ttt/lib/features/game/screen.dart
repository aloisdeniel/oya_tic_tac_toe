import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/game/widgets/board.dart';
import 'package:oya_ttt/features/game/widgets/player_indicator.dart';
import 'package:oya_ttt/features/game/widgets/status_indicator.dart';
import 'package:oya_ttt/features/game_result/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameScreen extends ConsumerWidget {
  final String mode;

  const GameScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch($currentGame).value;
    if (game == null) return const SizedBox();

    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xFF000000)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          switch (game.state) {
            BasicGameState state => BoardView(
              game: game,
              board: state.board,
              onCellTapped: (Position value) {
                final notifier = ref.read($currentGame.notifier);
                notifier.updateState(state.play(value));
              },
            ),
            _ => const SizedBox(),
          },
          if (game.isOver)
            Positioned.fill(
              key: Key('result'),
              child: FadeIn(child: const GameResultScreen()),
            )
          else ...[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(child: GameStatusIndicator()),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: GamePlayerIndicator(
                isActive: game.state.nextPlayer == GamePlayerId.player1,
                player: game.player1,
                direction: AppCharacterDirection.right,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GamePlayerIndicator(
                isActive: game.state.nextPlayer == GamePlayerId.player2,
                player: game.player2,
                direction: AppCharacterDirection.left,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
