import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
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
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Row(
        textDirection: direction,
        spacing: 24,
        children: [
          SizedBox.square(dimension: 82, child: Container()),
          Text('Computer', style: theme.text.button),
        ],
      ),
    );
  }
}
