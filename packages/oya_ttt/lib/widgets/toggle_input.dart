import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';

class ToggleInput extends StatelessWidget {
  const ToggleInput({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Material(
      color: Colors.transparent,
      child: Switch(
        value: value,
        onChanged: onChanged,
        inactiveTrackColor: theme.color.main.background,
        inactiveThumbColor: theme.color.main.foregroundSecondary,
        activeTrackColor: theme.color.highlight.background,
        activeThumbColor: theme.color.highlight.foreground,
      ),
    );
  }
}
