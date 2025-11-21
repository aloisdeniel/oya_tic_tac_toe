import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/pick_user/widgets/computer_tile.dart';
import 'package:oya_ttt/features/pick_user/widgets/new_user_tile.dart';
import 'package:oya_ttt/features/pick_user/widgets/user_tile.dart';
import 'package:oya_ttt/state/users.dart';
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

typedef UserFilter = bool Function(User user);

sealed class PickUserResult {
  const PickUserResult();
}

class PickUserHumanResult extends PickUserResult {
  const PickUserHumanResult(this.user);
  final User user;
}

class PickUserComputerResult extends PickUserResult {
  const PickUserComputerResult();
}

class PickUserModal extends ConsumerWidget {
  const PickUserModal({
    super.key,
    required this.background,
    required this.status,
    this.title,
    this.subtitle,
    this.filter,
    this.canPickComputer = false,
  });

  final Widget status;
  final String? title;
  final Widget? subtitle;
  final UserFilter? filter;
  final bool canPickComputer;
  final BackgroundIllustration background;

  static Future<PickUserResult?> show(
    BuildContext context, {
    required Widget status,
    UserFilter? filter,
    BackgroundIllustration background = BackgroundIllustration.room2,
    String? title,
    Widget? subtitle,
    bool canPickComputer = false,
    PickerResultResultCallback<PickUserResult>? onResult,
  }) {
    return Navigator.push<PickUserResult>(
      context,
      GradientPageRoute(
        pageBuilder: (context, animation, secondaryAnimation) => PickerResult(
          onResult: onResult,
          child: PickUserModal(
            status: status,
            title: title,
            subtitle: subtitle,
            filter: filter,
            background: background,
            canPickComputer: canPickComputer,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    var users = ref.watch($users).value ?? [];
    if (filter case final filter?) {
      users = users.where(filter).toList();
    }
    return Background(
      illustration: background,
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
          child: Column(
            children: [
              HeaderStatus(child: status),
              Header(title: Text(title ?? l10n.users)),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(theme.spacing.regular),
                  children: [
                    if (canPickComputer) ...[
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 800),
                          child: ComputerTile(
                            onTap: () {
                              PickerResult.send<PickUserResult>(
                                context,
                                PickUserComputerResult(),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: theme.spacing.medium),
                    ],
                    for (final user in users) ...[
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 800),
                          child: UserTile(
                            user: user,
                            onTap: () {
                              PickerResult.send<PickUserResult>(
                                context,
                                PickUserHumanResult(user),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: theme.spacing.small),
                    ],
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 800),
                        child: NewUserTile(onUserCreated: (newUser) {}),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                minimum: EdgeInsets.all(theme.spacing.large),
                child: AppButton(
                  style: FrameStyle.regular,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text(l10n.cancel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
