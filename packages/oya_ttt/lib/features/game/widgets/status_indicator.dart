import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/theme/theme.dart';

class GameStatusIndicator extends ConsumerWidget {
  const GameStatusIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final game = ref.watch($currentGame).value;
    final time = ref.watch($gameTime).value ?? Duration.zero;
    return Container(
      color: theme.color.main.background,
      constraints: BoxConstraints(minWidth: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          spacing: 12,
          children: [
            Text(
              '${game?.mode.name.toUpperCase()}',
              style: theme.text.button.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
            Text(
              '${time.inMinutes.toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}',
              style: theme.text.body.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
