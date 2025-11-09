import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class PlayerPreview extends StatelessWidget {
  const PlayerPreview({required this.player, required this.isPlayer2});

  final GamePlayer player;
  final bool isPlayer2;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final accent = theme.color.accents(player.character);
    final direction = isPlayer2
        ? AppCharacterDirection.left
        : AppCharacterDirection.right;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeIn(
          delay: isPlayer2 ? const Duration(milliseconds: 200) : null,
          child: AppCharacter(
            direction: direction,
            gradientFromBottom: [
              theme.color.main.background,
              theme.color.main.background.withValues(alpha: 0),
            ],
            character: player.character,
          ),
        ),
        Container(
          color: theme.color.main.background,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              textDirection: isPlayer2 ? TextDirection.rtl : TextDirection.ltr,
              spacing: 12,
              children: [
                SizedBox.square(
                  dimension: 82,
                  child: AppCharacterAvatar(
                    direction: direction,
                    character: player.character,
                  ),
                ),
                Text(switch (player.user) {
                  User user => user.name,
                  null => 'Computer',
                }, style: theme.text.button.copyWith(color: accent.foreground)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
