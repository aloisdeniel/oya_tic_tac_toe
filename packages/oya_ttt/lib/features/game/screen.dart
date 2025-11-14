import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/game/classic.dart';
import 'package:oya_ttt/features/game/meta.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGame = ref.watch($currentGame);
    final game = asyncGame.value;
    if (game == null) return const SizedBox();
    return switch (game.state) {
      BasicGameState basic => ClassicGameScreen(state: basic),
      MetaGameState meta => MetaGameScreen(state: meta),
      _ => throw Exception('Unexpected type'),
    };
  }
}
