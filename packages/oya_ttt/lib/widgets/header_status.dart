import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';

/// A status badge widget with a diagonal decorated background.
///
/// Displays content with a highlighted diagonal background and themed foreground
/// color. Commonly used for status indicators in headers.
///
/// Example:
/// ```dart
/// HeaderStatus(
///   child: Text('Player Turn'),
/// )
/// ```
class HeaderStatus extends StatelessWidget {
  const HeaderStatus({super.key, required this.child});

  /// The child widget to display inside the status badge.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final safeAreas = MediaQuery.paddingOf(context);
    final theme = AppTheme.of(context);
    final result = DiagonalDecorated(
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
    if (safeAreas.top > 0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: safeAreas.top,
            width: double.infinity,
            color: theme.color.highlight.background,
          ),
          Center(child: result),
        ],
      );
    }
    return result;
  }
}
