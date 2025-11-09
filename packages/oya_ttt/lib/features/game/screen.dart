import 'package:flutter/material.dart';
import 'package:oya_ttt/features/game/basic_board.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameScreen extends StatefulWidget {
  final String mode;

  const GameScreen({super.key, required this.mode});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Game? game;

  @override
  Widget build(BuildContext context) {
    final game = this.game;
    if (game == null) return SizedBox();
    final theme = AppTheme.of(context);
    return Background.park1(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.42),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: switch (game.state) {
                BasicGameState state => BoardView(
                  game: game,
                  board: state.board,
                  onPlay: (Position value) {
                    setState(() {
                      this.game = game.copyWith(state: state.play(value));
                    });
                  },
                ),
                _ => const SizedBox(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
