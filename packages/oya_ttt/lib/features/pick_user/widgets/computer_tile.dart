import 'package:flutter/material.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

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
              character: GameCharacter.robot,
            ),
          ),
          Text('Computer'),
        ],
      ),
    );
  }
}
