import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/data/color.dart';
import 'package:oya_ttt/theme/theme.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.value,
    required this.label,
    required this.accent,
  });
  final String value;
  final String label;
  final AppThemeAccentColorData? accent;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      color: accent?.backgroundSubtle ?? theme.color.highlight.background,
      padding: EdgeInsets.all(theme.spacing.medium),
      child: Column(
        children: [
          Text(
            value,
            style: theme.text.header2.copyWith(
              color: accent?.foreground ?? theme.color.highlight.foreground,
            ),
          ),

          Text(
            label,
            style: theme.text.button.copyWith(
              color: theme.color.highlight.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
