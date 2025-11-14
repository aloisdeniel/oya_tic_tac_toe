import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/game_result/widgets/replay.dart';
import 'package:oya_ttt/features/ready_to_start/widgets/character_presentation.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class GameResultScreen extends ConsumerWidget {
  const GameResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch($currentGame);
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: theme.color.main.background.withValues(alpha: 0.95),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: theme.spacing.medium,
        children: [
          if (game.value?.winner?.character case final character?) ...[
            Expanded(
              key: Key('character'),
              flex: 3,
              child: DiagonalDecorated(
                smallerEdge: DiagonalEdge.bottom,
                color: theme.color.accents(character).backgroundSubtle,
                child: LayoutBuilder(
                  builder: (context, layout) {
                    if (layout.maxHeight < 200) {
                      return SafeArea(
                        bottom: false,
                        minimum: EdgeInsets.all(theme.spacing.small),
                        child: FittedBox(
                          child: AppCharacterAvatar(character: character),
                        ),
                      );
                    }

                    return SafeArea(
                      bottom: false,
                      minimum: EdgeInsets.all(theme.spacing.medium),
                      child: CharacterPresentation(
                        symbolOpacity: 0.5,
                        character: character,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          if (game.value case final game?) ...[
            FadeIn(
              child: Text(
                switch (game.winner) {
                  GamePlayer(:final user) => l10n.playerWon(
                    user?.name ?? l10n.computer,
                  ),
                  null => l10n.draw,
                },
                style: theme.text.header1.copyWith(
                  color: switch (game.winner?.character) {
                    GameCharacter c => theme.color.accents(c).foreground,
                    _ => theme.color.main.foreground,
                  },
                ),
              ),
            ),
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
              child: Text(l10n.newGame),
            ),
          ] else ...[
            FadeIn(
              child: Text(
                l10n.draw,
                style: theme.text.header1.copyWith(
                  color: switch (game.value?.winner?.character) {
                    GameCharacter c => theme.color.accents(c).foreground,
                    _ => theme.color.main.foreground,
                  },
                ),
              ),
            ),
          ],
          AppButton(
            onPressed: () {
              context.replace('/home');
            },
            style: FrameStyle.primary,
            child: Text(l10n.exit),
          ),
          SizedBox(height: theme.spacing.large),
        ],
      ),
    );
  }
}
