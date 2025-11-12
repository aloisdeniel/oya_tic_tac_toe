import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';

class GameStatusIndicator extends ConsumerWidget {
  const GameStatusIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final game = ref.watch($currentGame).value;
    final time = ref.watch($gameTime).value ?? Duration.zero;
    return DiagonalDecorated(
      smallerEdge: DiagonalEdge.bottom,
      color: theme.color.highlight.background,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 200),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spacing.small),
          child: Column(
            spacing: theme.spacing.tiny,
            children: [
              Text(
                '${game?.mode.name.toUpperCase()}',
                style: theme.text.button.copyWith(
                  color: theme.color.highlight.foreground,
                ),
              ),
              Text(
                '${time.inMinutes.toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}',
                style: theme.text.body.copyWith(
                  color: theme.color.highlight.foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
