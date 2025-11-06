import 'package:oya_ttt_core/src/modes/basic/game.dart';

extension AI on GameState {
  /// Calculates the best next move for the AI using the minimax algorithm.
  /// Returns a Move object representing the optimal move for the current player.
  Move calculateNextMove() {
    final state = this;

    if (state.isOver) {
      throw StateError('Cannot calculate move: game is already over');
    }

    final legalMoves = state.legalMoves.toList();
    if (legalMoves.isEmpty) {
      throw StateError('No legal moves available');
    }

    // For the first move, prefer center or corners for better strategic positioning
    if (state.history.isEmpty) {
      // Center is best opening
      return Move(turn: 1, player: state.nextPlayer, pos: const Position(1, 1));
    }

    Position? bestMove;
    int bestScore = -1000;

    // Try each legal move and evaluate using minimax
    for (final pos in legalMoves) {
      final nextState = state.play(pos);
      final score = _minimax(nextState, false, state.nextPlayer, -1000, 1000);

      if (score > bestScore) {
        bestScore = score;
        bestMove = pos;
      }
    }

    if (bestMove == null) {
      throw StateError('Failed to find a valid move');
    }

    return Move(
      turn: state.history.length + 1,
      player: state.nextPlayer,
      pos: bestMove,
    );
  }
}

/// Minimax algorithm with alpha-beta pruning.
/// Returns the score for the maximizing player (the AI).
int _minimax(
  GameState state,
  bool isMaximizing,
  GamePlayer aiPlayer,
  int alpha,
  int beta,
) {
  // Base case: evaluate terminal states
  if (state.isOver) {
    if (state.winner == aiPlayer) {
      return 10 - state.history.length; // Win faster = higher score
    } else if (state.winner != null) {
      return -10 + state.history.length; // Lose slower = less negative
    } else {
      return 0; // Draw
    }
  }

  if (isMaximizing) {
    int maxScore = -1000;
    for (final pos in state.legalMoves) {
      final nextState = state.play(pos);
      final score = _minimax(nextState, false, aiPlayer, alpha, beta);
      maxScore = score > maxScore ? score : maxScore;
      alpha = alpha > score ? alpha : score;
      if (beta <= alpha) break; // Alpha-beta pruning
    }
    return maxScore;
  } else {
    int minScore = 1000;
    for (final pos in state.legalMoves) {
      final nextState = state.play(pos);
      final score = _minimax(nextState, true, aiPlayer, alpha, beta);
      minScore = score < minScore ? score : minScore;
      beta = beta < score ? beta : score;
      if (beta <= alpha) break; // Alpha-beta pruning
    }
    return minScore;
  }
}
