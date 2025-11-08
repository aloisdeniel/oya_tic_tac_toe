import 'package:flutter/material.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class ModeTile extends StatelessWidget {
  const ModeTile(this.mode, {super.key, required this.onTap});

  final GameMode mode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Text(mode.name),
    );
  }
}
