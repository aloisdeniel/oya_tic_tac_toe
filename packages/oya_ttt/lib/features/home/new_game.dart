import 'package:flutter/widgets.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/features/pick_mode/screen.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

Future<Game?> showNewGame(BuildContext context, User user) async {
  final mode = await PickModeModal.show(context);
  if (mode != null && context.mounted) {
    final userCharacter = await PickCharacterModal.show(
      context,
      title: 'Character',
      subtitle: Text('Player 1 | ${user.name}'),
      background: BackgroundIllustration.elevator,
      character: user.favoriteCharacter,
      // TODO selected favorite
    );

    if (userCharacter != null && context.mounted) {
      final opponentUser = await PickUserModal.show(
        context,
        title: 'Player 2',
        background: BackgroundIllustration.elevator,
        filter: (other) => other.id != 0, // Current user id
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
          return Game(
            id: 1,
            player1: player1,
            player2: player2,
            state: switch (mode) {
              GameMode.basic => BasicGameState.initial(),
              GameMode.meta => MetaGameState.initial(),
            },
          );
        }
      }
    }
  }
  return null;
}
