import 'package:flutter/material.dart';
import 'package:oya_ttt/features/pick_mode/widgets/mode_tile.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/modal_result.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/gradient_page_transition.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt/widgets/header_status.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class PickModeModal extends StatelessWidget {
  const PickModeModal({super.key, required this.status});

  final Widget status;

  static Future<GameMode?> show(
    BuildContext context, {
    required Widget status,
    PickerResultResultCallback<GameMode>? onResult,
  }) {
    return Navigator.push<GameMode>(
      context,
      GradientPageRoute(
        pageBuilder: (context, animation, secondaryAnimation) => PickerResult(
          onResult: onResult,
          child: PickModeModal(status: status),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Background.elevator(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                HeaderStatus(child: status),
                Header(title: Text(l10n.gameMode)),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: ListView(
                      padding: EdgeInsets.all(theme.spacing.regular),
                      children: [
                        for (final mode in GameMode.values) ...[
                          ModeTile(
                            mode,
                            onTap: () {
                              PickerResult.send(context, mode);
                            },
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),
                ),
                AppButton(
                  style: FrameStyle.regular,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text(l10n.cancel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
