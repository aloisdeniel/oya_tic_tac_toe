import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/new_game/state.dart';
import 'package:oya_ttt/features/new_game/widgets/progress.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/features/pick_mode/screen.dart';
import 'package:oya_ttt/features/pick_user/screen.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

Future<Game?> showNewGame(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  ref.invalidate($newGame);
  await _stepMode(context);
  final result = ref.read($newGame);
  if (result.isComplete) {
    final newGame = ref
        .read($currentGame.notifier)
        .start(
          mode: result.mode!,
          player1: GamePlayer.user(result.user1!, result.character1!),
          player2: GamePlayer(
            user: result.user2,
            character: result.character2!,
          ),
        );
    return newGame;
  }
  return null;
}

Future<void> _stepMode(BuildContext context) async {
  if (!context.mounted) return;
  await PickModeModal.show(
    context,
    status: NewGameProgress(),
    onResult: (context, mode) async {
      final ref = ProviderScope.containerOf(context);
      final notifier = ref.read($newGame.notifier);
      notifier.setMode(mode);
      await _stepUser1(context);
      if (context.mounted) Navigator.pop(context);
    },
  );
}

Future<void> _stepUser1(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  final user = await ref.read($user.future);
  if (user == null || !context.mounted) return;
  final notifier = ref.read($newGame.notifier);
  notifier.setUser1(user);
  await _stepCharacter1(context);
}

Future<void> _stepCharacter1(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  final user = ref.read($newGame).user1;
  if (user == null || !context.mounted) return;
  final l10n = AppLocalizations.of(context)!;
  await PickCharacterModal.show(
    context,
    status: NewGameProgress(),
    title: l10n.character,
    subtitle: Text(l10n.playerWithName(l10n.player1, user.name)),
    background: BackgroundIllustration.elevator,
    character: user.favoriteCharacter,
    onResult: (context, character) async {
      final notifier = ref.read($newGame.notifier);
      notifier.setCharacter1(character);
      await _stepUser2(context);
      if (context.mounted) Navigator.pop(context);
    },
  );
}

Future<void> _stepUser2(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  final user = ref.read($newGame).user1;
  if (user == null || !context.mounted) return;
  final l10n = AppLocalizations.of(context)!;
  await PickUserModal.show(
    context,
    status: NewGameProgress(),
    canPickComputer: true,
    title: l10n.player2,
    background: BackgroundIllustration.elevator,
    filter: (other) => other.id != user.id,
    onResult: (context, opponentUser) async {
      final notifier = ref.read($newGame.notifier);
      notifier.setUser2(switch (opponentUser) {
        PickUserHumanResult(:final user) => user,
        PickUserComputerResult() => null,
      });
      await _stepCharacter2(context);
      if (context.mounted) Navigator.pop(context);
    },
  );
}

Future<void> _stepCharacter2(BuildContext context) async {
  final ref = ProviderScope.containerOf(context);
  final user = ref.read($newGame).user2;
  if (!context.mounted) return;
  if (user == null) {
    // AI
    final notifier = ref.read($newGame.notifier);
    notifier.setCharacter2(GameCharacter.robot);
    notifier.complete();
    return;
  }
  final l10n = AppLocalizations.of(context)!;
  await PickCharacterModal.show(
    context,
    status: NewGameProgress(),
    title: l10n.character,
    subtitle: Text(l10n.playerWithName(l10n.player1, user.name)),
    background: BackgroundIllustration.elevator,
    character: user.favoriteCharacter,
    onResult: (context, character) async {
      final notifier = ref.read($newGame.notifier);
      notifier.setCharacter2(character);
      notifier.complete();
      if (context.mounted) Navigator.pop(context);
    },
  );
}
