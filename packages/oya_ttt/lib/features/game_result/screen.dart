import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/game_result/widgets/replay.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';

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
          if (game.value case final game?) ...[
            GameReplay(game: game),
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
            style: FrameStyle.regular,
            child: Text('EXIT'),
          ),
        ],
      ),
    );
  }
}
