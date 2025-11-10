import 'package:flutter/widgets.dart';
import 'package:oya_ttt/features/game_result/widgets/game_mini_board.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameReplay extends StatefulWidget {
  const GameReplay({super.key, required this.game});

  final Game game;

  @override
  State<GameReplay> createState() => _GameReplayState();
}

class _GameReplayState extends State<GameReplay> {
  late int _currentTurn = widget.game.state.turn;

  @override
  Widget build(BuildContext context) {
    final maxTurns = widget.game.state.turn;
    final state = switch (widget.game.state) {
      BasicGameState v => v.rewind(_currentTurn),
      _ => null,
    };
    return Column(
      children: [
        if (state is BasicGameState)
          Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: GameMiniBoard(game: widget.game, state: state),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                style: FrameStyle.regular,
                onPressed: _currentTurn > 0
                    ? () {
                        setState(() {
                          _currentTurn--;
                        });
                      }
                    : null,
                child: const Text('Previous'),
              ),

              Text(
                'Turn $_currentTurn of $maxTurns',
                style: const TextStyle(fontSize: 18),
              ),
              AppButton(
                style: FrameStyle.regular,
                onPressed: _currentTurn < maxTurns
                    ? () {
                        setState(() {
                          _currentTurn++;
                        });
                      }
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
