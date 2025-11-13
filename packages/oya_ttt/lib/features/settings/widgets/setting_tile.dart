import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/frame.dart';
import 'package:oya_ttt/widgets/frame_style.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, required this.label, required this.value});

  final String label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DefaultFrameStyle(
      style: FrameStyle.regular,
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.regular,
        vertical: theme.spacing.small,
      ),
      child: Frame(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), value],
        ),
      ),
    );
  }
}
