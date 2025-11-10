import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.subtitle});

  final Widget title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final children = <Widget>[
      DefaultForeground(
        foreground: theme.color.main.foreground,
        textStyle: theme.text.header2,
        child: this.title,
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
