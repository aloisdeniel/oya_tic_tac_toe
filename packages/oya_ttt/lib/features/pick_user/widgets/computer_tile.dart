import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';

class ComputerTile extends StatelessWidget {
  const ComputerTile({
    super.key,
    required this.onTap,
    this.direction = TextDirection.ltr,
  });

  final TextDirection direction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Row(
        textDirection: direction,
        spacing: 24,
        children: [
          SizedBox.square(
            dimension: 82,
            child: Center(child: Icon(Icons.bolt)),
          ),
          Text('Computer'),
        ],
      ),
    );
  }
}
