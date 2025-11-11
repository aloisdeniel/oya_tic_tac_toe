import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';

class HeaderStatus extends StatelessWidget {
  const HeaderStatus({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DiagonalDecorated(
      smallerEdge: DiagonalEdge.bottom,
      color: theme.color.highlight.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: DefaultTextStyle(
          style: theme.text.body.copyWith(
            color: theme.color.highlight.foreground,
          ),
          child: child,
        ),
      ),
    );
  }
}
