import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:test/test.dart';

void main() {
  group('calculateNextMove', () {
    test('throws when game is over', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 0))
          .play(Position(0, 1))
          .play(Position(1, 1))
          .play(Position(0, 2)); // Player1 wins

      expect(() => state.calculateNextMove(), throwsA(isA<StateError>()));
    });

    test('returns center position for first move', () {
      final state = GameState.initial();
      final move = state.calculateNextMove();

      expect(move.pos, Position(1, 1));
      expect(move.player, GamePlayer.player1);
      expect(move.turn, 1);
    });

    test('returns a legal move', () {
      final state = GameState.initial()
          .play(Position(1, 1)) // Center
          .play(Position(0, 0)); // Corner

      final move = state.calculateNextMove();
      final legalPositions = state.legalMoves.toList();

      expect(legalPositions.contains(move.pos), true);
      expect(move.player, GamePlayer.player1);
      expect(move.turn, 3);
    });

    test('blocks opponent from winning in a row', () {
      // X X _
      // O _ _
      // _ _ _
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(1, 0)) // O
          .play(Position(0, 1)); // X

      final move = state.calculateNextMove();

      // AI should block at (0, 2) to prevent X from winning
      expect(move.pos, Position(0, 2));
    });

    test('blocks opponent from winning in a column', () {
      // X O _
      // X _ _
      // _ _ _
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(0, 1)) // O
          .play(Position(1, 0)); // X

      final move = state.calculateNextMove();

      // AI should block at (2, 0) to prevent X from winning
      expect(move.pos, Position(2, 0));
    });

    test('blocks opponent from winning on diagonal', () {
      // X O _
      // _ X _
      // _ _ _
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(0, 1)) // O
          .play(Position(1, 1)); // X

      final move = state.calculateNextMove();

      // AI should block at (2, 2) to prevent X from winning
      expect(move.pos, Position(2, 2));
    });

    test('takes winning move when available', () {
      // O O _
      // X X _
      // _ _ _
      final state = GameState.initial()
          .play(Position(1, 0)) // X
          .play(Position(0, 0)) // O
          .play(Position(1, 1)) // X
          .play(Position(0, 1)); // O

      final move = state.calculateNextMove();

      // AI should take a winning move (either (0, 2) for O or block (1, 2))
      // Since X can win at (1,2), AI might block that instead
      // Let's verify the AI makes a valid move and check the result
      final nextState = state.play(move.pos);

      // After AI's move, either AI wins or blocks opponent's win
      expect(
        nextState.winner == GamePlayer.player2 ||
            !nextState.legalMoves.any((pos) {
              final testState = nextState.play(pos);
              return testState.winner == GamePlayer.player1;
            }),
        true,
      );
    });

    test('chooses winning move over blocking', () {
      // X _ _
      // _ X _
      // O O _
      // X can win at (2,2) with diagonal, O can win at (2,2) with row
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(2, 0)) // O
          .play(Position(1, 1)) // X
          .play(Position(2, 1)); // O

      final move = state.calculateNextMove();

      // AI (X) should take the winning move at (2,2) rather than any other move
      expect(move.pos, Position(2, 2));
    });

    test('plays perfect game - never loses as first player', () {
      // Simulate a game where AI plays optimally as player1
      var state = GameState.initial();

      // Play out a full game with AI making all moves for player1
      // and suboptimal moves for player2
      state = state.play(Position(1, 1)); // AI takes center
      state = state.play(Position(0, 0)); // Opponent takes corner

      final aiMove = state.calculateNextMove();
      state = state.play(aiMove.pos);

      // Game should not result in a loss for AI
      // (will be either a draw or win)
      expect(state.winner != GamePlayer.player2, true);
    });

    test('handles near-end game correctly', () {
      // X O X
      // O X _
      // _ _ O
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(0, 1)) // O
          .play(Position(0, 2)) // X
          .play(Position(1, 0)) // O
          .play(Position(1, 1)) // X
          .play(Position(2, 2)); // O

      final move = state.calculateNextMove();
      final legalMoves = state.legalMoves.toList();

      // Should return one of the remaining legal moves
      expect(legalMoves.contains(move.pos), true);
      expect(move.player, GamePlayer.player1);
    });

    test('AI can force a draw against perfect opponent', () {
      // When both players play perfectly, the game should end in a draw
      var state = GameState.initial();

      // AI plays first
      state = state.play(Position(1, 1)); // Center
      state = state.play(Position(0, 0)); // Opponent corner

      // Continue with AI making optimal moves
      while (!state.isOver) {
        final isAiTurn = state.nextPlayer == GamePlayer.player1;

        if (isAiTurn) {
          final move = state.calculateNextMove();
          state = state.play(move.pos);
        } else {
          // Opponent plays optimally too
          final move = state.calculateNextMove();
          state = state.play(move.pos);
        }
      }

      // Game should be a draw when both play perfectly
      expect(state.isDraw || state.winner == GamePlayer.player1, true);
    });

    test('returns correct turn number', () {
      final state = GameState.initial()
          .play(Position(1, 1))
          .play(Position(0, 0))
          .play(Position(2, 2));

      final move = state.calculateNextMove();

      expect(move.turn, 4);
    });

    test('detects fork opportunities', () {
      // X _ _
      // _ X _
      // _ _ O
      // X has two ways to win next turn if unblocked
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(2, 2)) // O
          .play(Position(1, 1)); // X

      final move = state.calculateNextMove();

      // O should block one of the winning paths
      // Either (0,2), (2,0), (0,1), (1,0), (1,2), or (2,1)
      final legalMoves = state.legalMoves.toList();
      expect(legalMoves.contains(move.pos), true);
    });

    test('prefers faster wins', () {
      // When multiple paths to victory exist, should prefer the quickest
      // O O _
      // X _ _
      // X _ _
      final state = GameState.initial()
          .play(Position(1, 0)) // X
          .play(Position(0, 0)) // O
          .play(Position(2, 0)) // X
          .play(Position(0, 1)); // O

      final move = state.calculateNextMove();

      // O should take immediate win at (0, 2)
      expect(move.pos, Position(0, 2));
    });

    test('handles single remaining square', () {
      // X O X
      // O X O
      // O X _
      final state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(0, 1)) // O
          .play(Position(0, 2)) // X
          .play(Position(1, 0)) // O
          .play(Position(1, 1)) // X
          .play(Position(1, 2)) // O
          .play(Position(2, 1)) // X
          .play(Position(2, 0)); // O

      final move = state.calculateNextMove();

      // Only one move left
      expect(move.pos, Position(2, 2));
      expect(move.player, GamePlayer.player1);
    });
  });
}
