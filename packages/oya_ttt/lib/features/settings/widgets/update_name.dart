import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/state/users.dart';

Future<void> updateUserName(BuildContext context, WidgetRef ref) async {
  final user = await ref.read($user.future);
  if (user != null && context.mounted) {
    final name = await EditUserModal.show(
      context,
      status: Text(AppLocalizations.of(context)!.editUser),
      user: user,
    );
    if (name != null && context.mounted) {
      ref.read($users.notifier).updateUser(userId: user.id, name: name);
    }
  }
}
