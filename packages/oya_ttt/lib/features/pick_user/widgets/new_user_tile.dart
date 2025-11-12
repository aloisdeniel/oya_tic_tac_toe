import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class NewUserTile extends ConsumerWidget {
  const NewUserTile({super.key, required this.onUserCreated});

  final ValueChanged<User> onUserCreated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: () async {
        final logger = Logger('CreateInitialUser');
        final name = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditUserModal();
            },
          ),
        );
        logger.info('Provided name: $name');
        if (name != null && context.mounted) {
          final character = await PickCharacterModal.show(
            context,
            status: Text('New user'),
            character: GameCharacter.circle,
          );
          logger.info('Picked character: $character');
          if (character != null && context.mounted) {
            final notifier = ref.read($users.notifier);
            final user = await notifier.createUser(
              name: name,
              favoriteCharacter: character,
            );
            logger.info('User ${user.id} created.');
          }
        }
      },
      style: FrameStyle.regular,
      child: Row(
        spacing: theme.spacing.small,
        children: [
          SizedBox.square(dimension: 80, child: Icon(Icons.add)),
          Text('Create a new user'),
        ],
      ),
    );
  }
}
