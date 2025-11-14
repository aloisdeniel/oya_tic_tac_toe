import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/gradient_page_transition.dart';
import 'package:oya_ttt/widgets/header_status.dart';
import 'package:oya_ttt/widgets/text_input.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class EditUserModal extends StatefulWidget {
  const EditUserModal({super.key, this.title, this.name, this.status});

  final String? title;
  final String? name;
  final Widget? status;

  static Future<String?> show(
    BuildContext context, {
    required User user,
    Widget? status,
  }) {
    return Navigator.push<String>(
      context,
      GradientPageRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EditUserModal(status: status, name: user.name),
      ),
    );
  }

  @override
  State<EditUserModal> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserModal> {
  late final controller = TextEditingController(text: widget.name);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final viewInsets = MediaQuery.viewInsetsOf(context);
    return Background.room2(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Padding(
          padding: viewInsets,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: theme.spacing.medium,
            children: [
              if (widget.status case final status?) HeaderStatus(child: status),
              SizedBox(height: theme.spacing.large),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [
                        Text(
                          widget.title ?? l10n.whatsYourName,
                          style: theme.text.header2.copyWith(
                            color: theme.color.main.foreground,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(theme.spacing.medium),
                          child: TextInput(
                            hint: l10n.name,
                            controller: controller,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(theme.spacing.large),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return AppButton(
                      onPressed: controller.text.isNotEmpty
                          ? () => Navigator.pop(context, controller.text)
                          : null,
                      style: FrameStyle.primary,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: theme.spacing.regular,
                        ),
                        child: Text(l10n.validate),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
