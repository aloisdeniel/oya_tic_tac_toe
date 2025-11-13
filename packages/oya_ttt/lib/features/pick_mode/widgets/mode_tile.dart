import 'package:flutter/material.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class ModeTile extends StatelessWidget {
  const ModeTile(this.mode, {super.key, required this.onTap});

  final GameMode mode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = AppTheme.of(context);

    final (name, description) = switch (mode) {
      GameMode.classic => (l10n.classicMode, l10n.classicModeDescription),
      GameMode.meta => (l10n.metaMode, l10n.metaModeDescription),
    };

    return AppButton(
      onPressed: onTap,
      style: FrameStyle.regular,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: theme.text.button),
          SizedBox(height: theme.spacing.tiny),
          Opacity(
            opacity: 0.8,
            child: Text(
              description,
              style: theme.text.body,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
