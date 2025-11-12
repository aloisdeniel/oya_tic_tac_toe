import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class ComputerTile extends StatelessWidget {
  const ComputerTile({
    super.key,
    required this.onTap,
    this.direction = AppCharacterDirection.right,
  });

  final AppCharacterDirection direction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Row(
        textDirection: direction.toTextDirection(),
        spacing: theme.spacing.medium,
        children: [
          SizedBox.square(
            dimension: 82,
            child: AppCharacterAvatar(
              direction: direction,
              character: GameCharacter.robot,
            ),
          ),
          Text(AppLocalizations.of(context)!.computer),
        ],
      ),
    );
  }
}
