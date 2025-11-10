import 'package:flutter/material.dart';
import 'package:oya_ttt/features/game/widgets/board.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/transparent_image.dart';
import 'package:oya_ttt/widgets/glitch.dart';
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
    final theme = AppTheme.of(context);
    final asset = 'assets/background/screens.png';

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.color.main.background),
      child: Stack(
        children: [
          Positioned.fill(
            key: Key('bg'),
            child: AnimatedGlitch(
              colorDrift: 0.01,
              child: FadeInImage(
                image: AssetImage(asset),
                fit: BoxFit.contain,
                placeholder: transparentImage,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: switch (game?.state) {
                    BasicGameState state => BoardView(
                      game: game!,
                      board: state.board,
                      onPlay: (Position value) {
                        setState(() {
                          game = game!.copyWith(state: state.play(value));
                        });
                      },
                    ),
                    _ => const SizedBox(),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
