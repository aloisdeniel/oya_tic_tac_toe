import 'package:flutter/material.dart';
import 'package:oya_ttt/features/game_result/widgets/game_mini_board.dart';
import 'package:oya_ttt/theme/theme.dart';
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
    final theme = AppTheme.of(context);
    final maxTurns = widget.game.state.turn;
    final state = switch (widget.game.state) {
      BasicGameState v => v.rewind(_currentTurn),
      _ => null,
    };
    return Column(
      children: [
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              '$_currentTurn / $maxTurns',
              style: theme.text.body.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(theme.spacing.regular),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                child: Icon(Icons.chevron_left),
              ),

              if (state is BasicGameState)
                Padding(
                  padding: EdgeInsets.all(theme.spacing.regular),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 140),
                    child: GameMiniBoard(game: widget.game, state: state),
                  ),
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

                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
