import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/features/game/widgets/meta_board.dart';
import 'package:oya_ttt/features/game/widgets/player_indicator.dart';
import 'package:oya_ttt/features/game/widgets/status_indicator.dart';
import 'package:oya_ttt/features/game_result/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class MetaGameScreen extends ConsumerStatefulWidget {
  const MetaGameScreen({super.key, required this.state});

  final MetaGameState state;

  @override
  ConsumerState<MetaGameScreen> createState() => _MetaGameScreenState();
}

class _MetaGameScreenState extends ConsumerState<MetaGameScreen> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final asyncGame = ref.watch($currentGame);
    final game = asyncGame.value;
    if (game == null) return const SizedBox();
    final theme = AppTheme.of(context);
    return Background.park2(
      decoration: BoxDecoration(
        color: theme.color.main.background.withValues(alpha: 0.8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            spacing: theme.spacing.regular,
            children: [
              Center(child: GameStatusIndicator()),
              Expanded(
                child: MetaBoardView(
                  key: Key('board'),
                  game: game,
                  state: widget.state,
                  onCellTapped: (MetaPosition value) async {
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
              ),
              Row(
                children: [
                  Expanded(
                    key: Key('p1'),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GamePlayerIndicator(
                        isActive: game.state.nextPlayer == GamePlayerId.player1,
                        player: game.player1,
                        direction: AppCharacterDirection.right,
                      ),
                    ),
                  ),
                  Expanded(
                    key: Key('p2'),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GamePlayerIndicator(
                        isActive: game.state.nextPlayer == GamePlayerId.player2,
                        player: game.player2,
                        direction: AppCharacterDirection.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (game.isOver)
            Positioned.fill(
              key: Key('result'),
              child: FadeIn(child: const GameResultScreen()),
            ),
        ],
      ),
    );
  }
}
