import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';

/// A themed header widget with a title and optional subtitle.
///
/// Displays a title using header2 text style and an optional subtitle using
/// body text style. Applies appropriate foreground colors from the theme.
///
/// Example:
/// ```dart
/// Header(
///   title: Text('Welcome'),
///   subtitle: Text('Choose your character'),
/// )
/// ```
class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.subtitle});

  /// The title widget to display (typically Text).
  final Widget title;

  /// Optional subtitle widget to display below the title.
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final children = <Widget>[
      DefaultForeground(
        foreground: theme.color.main.foreground,
        textStyle: theme.text.header2,
        child: title,
      ),
    ];

    if (subtitle case final subtitle?) {
      children.add(
        DefaultForeground(
          foreground: theme.color.main.foregroundSecondary,
          textStyle: theme.text.body,
          child: subtitle,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: switch (children.length) {
        1 => children.first,
        _ => Column(spacing: 12, children: children),
      },
    );
  }
}
