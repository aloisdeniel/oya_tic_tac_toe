import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';

/// A centered text that overflows but fills vertically
/// its parent.
class BigBackgroundText extends StatelessWidget {
  const BigBackgroundText({
    super.key,
    required this.text,
    required this.color,
    this.xOffset = 0,
  });

  final String text;
  final Color color;
  final double xOffset;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Text(
        text,
        maxLines: 1,
        style: theme.text.button.copyWith(color: color),
      ),
    );
  }
}
