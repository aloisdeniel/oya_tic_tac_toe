import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/home/widgets/new_game_progress.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/features/pick_mode/screen.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

Future<Game?> showNewGame(BuildContext context, WidgetRef ref) async {
  final user = await ref.read($user.future);
  if (user == null) return null;
  if (!context.mounted) return null;
  final mode = await PickModeModal.show(context, status: NewGameProgress());
  if (mode != null && context.mounted) {
    final l10n = AppLocalizations.of(context)!;
    final userCharacter = await PickCharacterModal.show(
      context,
      status: NewGameProgress(mode: mode, player1Name: user.name),
      title: l10n.character,
      subtitle: Text(l10n.playerWithName(l10n.player1, user.name)),
      background: BackgroundIllustration.elevator,
      character: user.favoriteCharacter,
    );

    if (userCharacter != null && context.mounted) {
      final l10n = AppLocalizations.of(context)!;
      final opponentUser = await PickUserModal.show(
        context,
        status: NewGameProgress(
          mode: mode,
          player1Name: user.name,
          player1Character: userCharacter,
        ),
        canPickComputer: true,
        title: l10n.player2,
        background: BackgroundIllustration.elevator,
        filter: (other) => other.id != user.id,
      );

      if (opponentUser != null && context.mounted) {
        final l10n = AppLocalizations.of(context)!;
        final opponentCharacter = switch (opponentUser) {
          PickUserComputerResult() => GameCharacter.robot,
          PickUserHumanResult(:final user) => await PickCharacterModal.show(
            context,
            status: NewGameProgress(
              mode: mode,
              player1Name: user.name,
              player1Character: userCharacter,
              player2Name: user.name,
            ),
            background: BackgroundIllustration.elevator,
            title: l10n.character,
            subtitle: Text(l10n.playerWithName(l10n.player2, user.name)),
            character: user.favoriteCharacter,
            characters: GameCharacter.values
                .where((x) => x != userCharacter)
                .toList(),
          ),
        };
        if (opponentCharacter != null && context.mounted) {
          final player1 = GamePlayer.user(user, userCharacter);
          final player2 = switch (opponentUser) {
            PickUserHumanResult(:final user) => GamePlayer.user(
              user,
              opponentCharacter,
            ),
            PickUserComputerResult() => GamePlayer.ai(opponentCharacter),
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
