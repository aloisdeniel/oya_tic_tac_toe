import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/features/game/widgets/board.dart';
import 'package:oya_ttt/features/game/widgets/player_indicator.dart';
import 'package:oya_ttt/features/game/widgets/status_indicator.dart';
import 'package:oya_ttt/features/game_result/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class ClassicGameScreen extends ConsumerStatefulWidget {
  const ClassicGameScreen({super.key, required this.state});

  final BasicGameState state;

  @override
  ConsumerState<ClassicGameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<ClassicGameScreen> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final asyncGame = ref.watch($currentGame);
    final game = asyncGame.value;
    if (game == null) return const SizedBox();

    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xFF000000)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          BoardView(
            key: Key('board'),
            game: game,
            board: widget.state.board,
            onCellTapped: (Position value) async {
              if (_isPlaying) return;

              setState(() {
                _isPlaying = true;
              });

              final notifier = ref.read($currentGame.notifier);
              try {
                await notifier.play(value);
              } catch (e, st) {
                Logger.root.severe('Failed to play', e, st);
              }

              setState(() {
                _isPlaying = false;
              });
            },
          ),
          if (game.isOver)
            Positioned.fill(
              key: Key('result'),
              child: FadeIn(child: const GameResultScreen()),
            )
          else ...[
            Positioned(
              key: Key('status'),
              top: 0,
              left: 0,
              right: 0,
              child: Center(child: GameStatusIndicator()),
            ),
            Positioned(
              key: Key('p1'),
              bottom: 0,
              left: 0,
              child: GamePlayerIndicator(
                isActive: game.state.nextPlayer == GamePlayerId.player1,
                player: game.player1,
                direction: AppCharacterDirection.right,
              ),
            ),
            Positioned(
              key: Key('p2'),
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
