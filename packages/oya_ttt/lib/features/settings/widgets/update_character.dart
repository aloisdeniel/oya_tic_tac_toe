import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

Future<void> updateUserCharacter(BuildContext context, WidgetRef ref) async {
  final user = await ref.read($user.future);
  if (user != null && context.mounted) {
    final character = await PickCharacterModal.show(
      context,
      status: Text(AppLocalizations.of(context)!.editUser),
      character: user.favoriteCharacter,
    );

    if (character != null && context.mounted) {
      ref
          .read($users.notifier)
          .updateUser(userId: user.id, favoriteCharacter: character);
    }
  }
}
