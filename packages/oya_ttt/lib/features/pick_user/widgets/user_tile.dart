import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    required this.onTap,
    this.direction = AppCharacterDirection.right,
  });

  final AppCharacterDirection direction;
  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Row(
        textDirection: direction.toTextDirection(),
        spacing: 24,
        children: [
          SizedBox.square(
            dimension: 82,
            child: AppCharacterAvatar(
              direction: direction,
              character: user.favoriteCharacter,
            ),
          ),
          Text(user.name, style: theme.text.button),
        ],
      ),
    );
  }
}
