import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:oya_ttt/features/game/widgets/screens.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class ScreensShadow extends StatelessWidget {
  const ScreensShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox.fromSize(
        size: screensIllustrationSize,
        child: Stack(
          children: [
            for (var i = 0; i < screenCoordinates.length; i++)
              Positioned.fromRect(
                rect: screenCoordinates[i],
                child: _Shadow(key: ValueKey(i), index: i),
              ),
          ],
        ),
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedGlitch(
      scanLineJitter: 0.6,
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.94,
            stops: [0.55, 1],
            colors: [
              theme.color.main.background.withValues(alpha: 0),
              theme.color.main.background.withValues(alpha: 0.75),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreensGlow extends StatelessWidget {
  const ScreensGlow({super.key, required this.board, required this.game});

  final Board board;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox.fromSize(
        size: screensIllustrationSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var i = 0; i < screenCoordinates.length; i++)
              Positioned.fromRect(
                rect: screenCoordinates[i],
                child: _Glow(
                  key: ValueKey(i),
                  index: i,
                  game: game,
                  board: board,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({
    super.key,
    required this.board,
    required this.game,
    required this.index,
  });

  final int index;
  final Game game;
  final Board board;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final position = Position.fromIndex(index);
    final playerId = board.at(position);
    final player = playerId == null ? null : game.player(playerId);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.bounceIn,
      child: switch (player) {
        GamePlayer(:final character) => ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaY: 24, sigmaX: 32),
          child: Transform.scale(
            scale: 1.3,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.52,
                  stops: [0.55, 1],
                  colors: [
                    theme.color
                        .accents(character)
                        .foreground
                        .withValues(alpha: 0),
                    theme.color
                        .accents(character)
                        .foreground
                        .withValues(alpha: 0.45),
                  ],
                ),
              ),
            ),
          ),
        ),

        _ => const SizedBox(),
      },
    );
  }
}
