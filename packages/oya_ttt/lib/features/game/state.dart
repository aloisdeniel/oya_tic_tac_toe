import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

final $currentGameId = NotifierProvider(CurrentGameIdNotifier.new);

final $currentGame = AsyncNotifierProvider(CurrentGameNotifier.new);

class CurrentGameIdNotifier extends Notifier<int?> {
  @override
  int? build() {
    return null;
  }

  void start(Game game) {
    // TODO save game in database
    state = game.id;
  }
}

class CurrentGameNotifier extends AsyncNotifier<Game?> {
  @override
  Future<Game?> build() async {
    final id = ref.watch($currentGameId);
    // TODO load from database if id not null;
    return null;
  }

  void updateState(GameState newState) {
    state = switch (state) {
      AsyncData(:final Game value) => AsyncData(
        value.copyWith(state: newState),
      ),
      _ => state,
    };
  }
}
