import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/pick_user/widgets/new_user_tile.dart';
import 'package:oya_ttt/features/pick_user/widgets/user_tile.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

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
    this.title,
    this.subtitle,
    this.filter,
  });

  final String? title;
  final Widget? subtitle;
  final UserFilter? filter;
  final BackgroundIllustration background;

  static Future<PickUserResult?> show(
    BuildContext context, {
    UserFilter? filter,
    BackgroundIllustration background = BackgroundIllustration.room2,
    String? title,
    Widget? subtitle,
  }) {
    return Navigator.push<PickUserResult>(
      context,
      MaterialPageRoute(
        builder: (context) => PickUserModal(
          title: title,
          subtitle: subtitle,
          filter: filter,
          background: background,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
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
              Header(title: Text(title ?? 'Change user')),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final user in users) ...[
                      UserTile(
                        user: user,
                        onTap: () {
                          Navigator.pop(context, PickUserHumanResult(user));
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                    NewUserTile(onUserCreated: (newUser) {}),
                  ],
                ),
              ),

              AppButton(
                style: FrameStyle.regular,
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text('CANCEL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
