import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/state/users.dart';

Future<void> updateUserName(BuildContext context, WidgetRef ref) async {
  final user = await ref.read($user.future);
  if (user != null && context.mounted) {
    final name = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditUserModal(name: user.name);
        },
      ),
    );
    if (name != null && context.mounted) {
      ref.read($users.notifier).updateUser(userId: user.id, name: name);
    }
  }
}
