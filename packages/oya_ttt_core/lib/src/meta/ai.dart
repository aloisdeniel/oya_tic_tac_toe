import 'package:oya_ttt_core/src/basic/game.dart';
import 'package:oya_ttt_core/src/meta/game.dart';

/// Calculates the best next move for the AI in meta tic-tac-toe.
/// Uses a heuristic-based evaluation with limited-depth minimax search.
MetaMove calculateNextMove(MetaGameState state) {
  if (state.isOver) {
    throw StateError('Cannot calculate move: game is already over');
  }

  final legalMoves = state.legalMoves.toList();
  if (legalMoves.isEmpty) {
    throw StateError('No legal moves available');
  }

  // For the first move, prefer center board, center cell
  if (state.history.isEmpty) {
    return MetaMove(
      turn: 1,
      player: state.nextPlayer,
      pos: const MetaPosition(Position(1, 1), Position(1, 1)),
    );
  }

  MetaPosition? bestMove;
  double bestScore = -double.infinity;

  // Evaluate each legal move
  for (final pos in legalMoves) {
    final nextState = state.play(pos);

    // Use minimax with limited depth due to computational complexity
    final score = _minimax(
      nextState,
      2,
      false,
      state.nextPlayer,
      -double.infinity,
      double.infinity,
    );

    if (score > bestScore) {
      bestScore = score;
      bestMove = pos;
    }
  }

  if (bestMove == null) {
    throw StateError('Failed to find a valid move');
  }

  return MetaMove(
    turn: state.history.length + 1,
    player: state.nextPlayer,
    pos: bestMove,
  );
}

/// Minimax algorithm with alpha-beta pruning and limited depth.
/// Uses heuristic evaluation for non-terminal states.
double _minimax(
  MetaGameState state,
  int depth,
  bool isMaximizing,
  GamePlayer aiPlayer,
  double alpha,
  double beta,
) {
  // Base case: terminal state or depth limit reached
  if (state.isOver || depth == 0) {
    return _evaluateState(state, aiPlayer);
  }

  if (isMaximizing) {
    double maxScore = -double.infinity;
    for (final pos in state.legalMoves) {
      final nextState = state.play(pos);
      final score = _minimax(
        nextState,
        depth - 1,
        false,
        aiPlayer,
        alpha,
        beta,
      );
      maxScore = score > maxScore ? score : maxScore;
      alpha = alpha > score ? alpha : score;
      if (beta <= alpha) break; // Alpha-beta pruning
    }
    return maxScore;
  } else {
    double minScore = double.infinity;
    for (final pos in state.legalMoves) {
      final nextState = state.play(pos);
      final score = _minimax(nextState, depth - 1, true, aiPlayer, alpha, beta);
      minScore = score < minScore ? score : minScore;
      beta = beta < score ? beta : score;
      if (beta <= alpha) break; // Alpha-beta pruning
    }
    return minScore;
  }
}

/// Evaluates a meta game state using heuristics.
/// Returns a score where positive favors the AI and negative favors the opponent.
double _evaluateState(MetaGameState state, GamePlayer aiPlayer) {
  // Terminal state evaluation
  if (state.isOver) {
    if (state.winner == aiPlayer) {
      return 1000.0 - state.history.length; // Win faster = higher score
    } else if (state.winner != null) {
      return -1000.0 + state.history.length; // Lose slower = less negative
    } else {
      return 0.0; // Draw
    }
  }

  double score = 0.0;
  final opponent = aiPlayer.other;

  // Evaluate the meta board
  score += _evaluateBoard(state.metaBoard, aiPlayer) * 100;

  // Evaluate individual boards
  for (final boardPos in state.boards.keys) {
    final board = state.boards[boardPos]!;
    final metaCell = state.metaBoard.at(boardPos);

    // Skip if board is already won
    if (metaCell != null) continue;

    // Evaluate the board state
    double boardScore = _evaluateBoard(board, aiPlayer);

    // Strategic board positions (center and corners are more valuable)
    final positionValue = _getPositionValue(boardPos);
    boardScore *= positionValue;

    score += boardScore * 10;
  }

  // Bonus for controlling the active board
  if (state.activeBoard != null) {
    final activeBoard = state.boards[state.activeBoard!]!;
    if (state.nextPlayer == aiPlayer) {
      // We get to play in a specific board - evaluate if it's advantageous
      score += _evaluateBoard(activeBoard, aiPlayer) * 5;
    } else {
      // Opponent gets to play in a specific board
      score -= _evaluateBoard(activeBoard, opponent) * 5;
    }
  }

  return score;
}

/// Evaluates a single board for a player.
/// Returns a score based on winning potential and threats.
double _evaluateBoard(Board board, GamePlayer player) {
  if (board.winner == player) return 50.0;
  if (board.winner != null) return -50.0;

  double score = 0.0;
  final opponent = player.other;

  // Check all winning lines
  for (final line in Board.winningLines) {
    int playerCount = 0;
    int opponentCount = 0;
    int emptyCount = 0;

    for (final idx in line) {
      final cell = board.cells[idx];
      if (cell == player) {
        playerCount++;
      } else if (cell == opponent) {
        opponentCount++;
      } else {
        emptyCount++;
      }
    }

    // Score based on line potential
    if (playerCount > 0 && opponentCount == 0) {
      // We have pieces in this line, opponent doesn't
      if (playerCount == 2 && emptyCount == 1) {
        score += 10.0; // One move away from winning
      } else if (playerCount == 1 && emptyCount == 2) {
        score += 2.0; // Two moves away
      }
    } else if (opponentCount > 0 && playerCount == 0) {
      // Opponent has pieces in this line, we don't
      if (opponentCount == 2 && emptyCount == 1) {
        score -= 10.0; // Must block opponent's win
      } else if (opponentCount == 1 && emptyCount == 2) {
        score -= 2.0; // Opponent building
      }
    }
  }

  // Center control bonus
  if (board.at(const Position(1, 1)) == player) {
    score += 3.0;
  } else if (board.at(const Position(1, 1)) == opponent) {
    score -= 3.0;
  }

  return score;
}

/// Returns strategic value of a board position (center > corners > edges).
double _getPositionValue(Position pos) {
  if (pos.row == 1 && pos.col == 1) {
    return 1.5; // Center
  } else if ((pos.row == 0 || pos.row == 2) && (pos.col == 0 || pos.col == 2)) {
    return 1.2; // Corners
  } else {
    return 1.0; // Edges
  }
}
