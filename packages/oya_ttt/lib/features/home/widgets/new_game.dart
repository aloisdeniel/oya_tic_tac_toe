import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/features/pick_mode/screen.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

Future<Game?> showNewGame(BuildContext context, WidgetRef ref) async {
  final user = await ref.read($user.future);
  if (user == null) return null;
  if (!context.mounted) return null;
  final mode = await PickModeModal.show(context);
  if (mode != null && context.mounted) {
    final userCharacter = await PickCharacterModal.show(
      context,
      title: 'Character',
      subtitle: Text('Player 1 | ${user.name}'),
      background: BackgroundIllustration.elevator,
      character: user.favoriteCharacter,
    );

    if (userCharacter != null && context.mounted) {
      final opponentUser = await PickUserModal.show(
        context,
        title: 'Player 2',
        background: BackgroundIllustration.elevator,
        filter: (other) => other.id != user.id,
      );

      if (opponentUser != null && context.mounted) {
        final opponentCharacter = await PickCharacterModal.show(
          context,
          background: BackgroundIllustration.elevator,
          title: 'Character',
          subtitle: Text(
            'Player 2 | ${switch (opponentUser) {
              PickUserHumanResult(:final user) => user.name,
              PickUserComputerResult() => 'Computer',
            }}',
          ),
          character: switch (opponentUser) {
            PickUserHumanResult(:final user) => user.favoriteCharacter,
            PickUserComputerResult() => GameCharacter.circle,
          },
          characters: GameCharacter.values
              .where((x) => x != userCharacter)
              .toList(),
        );
        if (opponentCharacter != null && context.mounted) {
          final player1 = GamePlayer.user(user, userCharacter);
          final player2 = switch (opponentUser) {
            PickUserHumanResult(:final user) => GamePlayer.user(
              user,
              opponentCharacter,
            ),
            PickUserComputerResult() => GamePlayer.ai(userCharacter),
          };
          final newGame = ref
              .read($currentGame.notifier)
              .start(player1: player1, player2: player2, mode: mode);
          return newGame;
        }
      }
    }
  }
  return null;
}
