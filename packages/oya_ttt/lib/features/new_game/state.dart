import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

final $newGame = NotifierProvider(() => NewGameNotifier());

class NewGameNotifier extends Notifier<NewGameProgressState> {
  @override
  NewGameProgressState build() {
    return NewGameProgressState();
  }

  void setMode(GameMode? mode) {
    if (mode != state.mode) {
      state = NewGameProgressState(
        mode: mode,
        user1: state.user1,
        user2: state.user2,
        character1: state.character1,
        character2: state.character2,
      );
    }
  }

  void setUser1(User? user1) {
    if (user1?.id != state.user1?.id) {
      state = NewGameProgressState(
        mode: state.mode,
        user1: user1,
        user2: state.user2,
        character1: state.character1,
        character2: state.character2,
      );
    }
  }

  void setUser2(User? user2) {
    if (user2?.id != state.user2?.id) {
      state = NewGameProgressState(
        mode: state.mode,
        user1: state.user1,
        user2: user2,
        character1: state.character1,
        character2: state.character2,
      );
    }
  }

  void setCharacter1(GameCharacter? character1) {
    if (character1 != state.character1) {
      state = NewGameProgressState(
        mode: state.mode,
        user1: state.user1,
        user2: state.user2,
        character1: character1,
        character2: state.character2,
      );
    }
  }

  void setCharacter2(GameCharacter? character2) {
    if (character2 != state.character2) {
      state = NewGameProgressState(
        mode: state.mode,
        user1: state.user1,
        user2: state.user2,
        character1: state.character1,
        character2: character2,
      );
    }
  }

  void complete() {
    if (!state.isComplete) {
      state = NewGameProgressState(
        isComplete: true,
        mode: state.mode,
        user1: state.user1,
        user2: state.user2,
        character1: state.character1,
        character2: state.character2,
      );
    }
  }
}

class NewGameProgressState {
  const NewGameProgressState({
    this.mode,
    this.user1,
    this.user2,
    this.character1,
    this.character2,
    this.isComplete = false,
  });
  final bool isComplete;
  final GameMode? mode;
  final User? user1;
  final GameCharacter? character1;
  final User? user2;
  final GameCharacter? character2;
}
