import 'package:flutter/material.dart';
import 'package:oya_ttt/features/pick_user/user_tile.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
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

class PickUserModal extends StatelessWidget {
  const PickUserModal({super.key, this.filter, required this.background});

  final UserFilter? filter;
  final BackgroundIllustration background;

  static Future<PickUserResult?> show(
    BuildContext context, {
    UserFilter? filter,
    BackgroundIllustration background = BackgroundIllustration.room2,
  }) {
    return Navigator.push<PickUserResult>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PickUserModal(filter: filter, background: background),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    var users = [
      User(id: 0, name: 'John', favoriteCharacter: GameCharacter.cross),
      User(id: 1, name: 'Rob', favoriteCharacter: GameCharacter.spade),
    ];
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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final user in users)
                      UserTile(
                        user: user,
                        onTap: () {
                          Navigator.pop(context, PickUserHumanResult(user));
                        },
                      ),
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
