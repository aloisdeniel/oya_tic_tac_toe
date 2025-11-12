import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/game_result/widgets/replay.dart';
import 'package:oya_ttt/features/ready_to_start/widgets/character_presentation.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameResultScreen extends ConsumerWidget {
  const GameResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch($currentGame);
    final theme = AppTheme.of(context);
    return Container(
      color: theme.color.main.background.withValues(alpha: 0.95),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (game.value?.winner?.character case final character?) ...[
            Expanded(
              flex: 3,
              child: DiagonalDecorated(
                smallerEdge: DiagonalEdge.bottom,
                color: theme.color.accents(character).backgroundSubtle,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CharacterPresentation(
                    symbolOpacity: 0.5,
                    character: character,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ] else
            const Spacer(),
          FadeIn(
            child: Text(
              switch (game.value?.winner) {
                GamePlayer(:final user) => '${user?.name ?? 'Computer'} won',
                null => 'Draw',
              },
              style: theme.text.header1.copyWith(
                color: switch (game.value?.winner?.character) {
                  GameCharacter c => theme.color.accents(c).foreground,
                  _ => theme.color.main.foreground,
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (game.value case final game?) ...[GameReplay(game: game)],
          const Spacer(),
          if (game.value case final game?) ...[
            AppButton(
              onPressed: () {
                ref
                    .read($currentGame.notifier)
                    .start(
                      player1: game.player1,
                      player2: game.player2,
                      mode: game.mode,
                    );
              },
              style: FrameStyle.regular,
              child: Text('NEW GAME'),
            ),
          ],
          AppButton(
            onPressed: () {
              context.replace('/home');
            },
            style: FrameStyle.primary,
            child: Text('EXIT'),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
