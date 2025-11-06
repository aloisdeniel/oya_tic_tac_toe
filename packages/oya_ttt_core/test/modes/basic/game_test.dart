import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:test/test.dart';

void main() {
  group('GamePlayer', () {
    test('other returns the opposite player', () {
      expect(GamePlayer.player1.other, GamePlayer.player2);
      expect(GamePlayer.player2.other, GamePlayer.player1);
    });
  });

  group('Position', () {
    test('creates valid position with row and col', () {
      final pos = Position(1, 2);
      expect(pos.row, 1);
      expect(pos.col, 2);
    });

    test('throws assertion error for invalid row', () {
      expect(() => Position(-1, 0), throwsA(isA<AssertionError>()));
      expect(() => Position(3, 0), throwsA(isA<AssertionError>()));
    });

    test('throws assertion error for invalid col', () {
      expect(() => Position(0, -1), throwsA(isA<AssertionError>()));
      expect(() => Position(0, 3), throwsA(isA<AssertionError>()));
    });

    test('creates position from index', () {
      expect(Position.fromIndex(0), Position(0, 0));
      expect(Position.fromIndex(1), Position(0, 1));
      expect(Position.fromIndex(2), Position(0, 2));
      expect(Position.fromIndex(3), Position(1, 0));
      expect(Position.fromIndex(4), Position(1, 1));
      expect(Position.fromIndex(5), Position(1, 2));
      expect(Position.fromIndex(6), Position(2, 0));
      expect(Position.fromIndex(7), Position(2, 1));
      expect(Position.fromIndex(8), Position(2, 2));
    });

    test('converts position to index', () {
      expect(Position(0, 0).index, 0);
      expect(Position(0, 1).index, 1);
      expect(Position(0, 2).index, 2);
      expect(Position(1, 0).index, 3);
      expect(Position(1, 1).index, 4);
      expect(Position(1, 2).index, 5);
      expect(Position(2, 0).index, 6);
      expect(Position(2, 1).index, 7);
      expect(Position(2, 2).index, 8);
    });

    test('toString returns formatted string', () {
      expect(Position(1, 2).toString(), '(1,2)');
    });
  });

  group('Board', () {
    test('creates empty board', () {
      final board = Board.empty();
      expect(board.cells.length, 9);
      expect(board.cells.every((cell) => cell == null), true);
    });

    test('at returns correct value at position', () {
      final board = Board.empty();
      expect(board.at(Position(0, 0)), null);
    });

    test('place marks a position and returns new board', () {
      final board = Board.empty();
      final newBoard = board.place(GamePlayer.player1, Position(0, 0));

      expect(board.at(Position(0, 0)), null);
      expect(newBoard.at(Position(0, 0)), GamePlayer.player1);
    });

    test('place throws when cell is occupied', () {
      final board = Board.empty().place(GamePlayer.player1, Position(0, 0));

      expect(
        () => board.place(GamePlayer.player2, Position(0, 0)),
        throwsA(isA<StateError>()),
      );
    });

    test('place throws when board is full', () {
      // Create a draw (no winner, full board)
      // X O X
      // X O O
      // O X X
      var board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0)) // X
          .place(GamePlayer.player2, Position(0, 1)) // O
          .place(GamePlayer.player1, Position(0, 2)) // X
          .place(GamePlayer.player1, Position(1, 0)) // X
          .place(GamePlayer.player2, Position(1, 1)) // O
          .place(GamePlayer.player2, Position(1, 2)) // O
          .place(GamePlayer.player2, Position(2, 0)) // O
          .place(GamePlayer.player1, Position(2, 1)) // X
          .place(GamePlayer.player1, Position(2, 2)); // X

      expect(board.isFull, true);
      expect(board.winner, null); // No winner, just full
      expect(
        () => board.place(GamePlayer.player1, Position(0, 0)),
        throwsA(isA<StateError>()),
      );
    });

    test('emptyPositions returns all empty positions', () {
      final board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player2, Position(1, 1));

      final empty = board.emptyPositions.toList();
      expect(empty.length, 7);
      expect(empty.contains(Position(0, 0)), false);
      expect(empty.contains(Position(1, 1)), false);
    });

    test('isFull returns true when board is full', () {
      var board = Board.empty();
      expect(board.isFull, false);

      // Create a draw (no winner, full board)
      // X O X
      // X O O
      // O X X
      board = board
          .place(GamePlayer.player1, Position(0, 0)) // X
          .place(GamePlayer.player2, Position(0, 1)) // O
          .place(GamePlayer.player1, Position(0, 2)) // X
          .place(GamePlayer.player1, Position(1, 0)) // X
          .place(GamePlayer.player2, Position(1, 1)) // O
          .place(GamePlayer.player2, Position(1, 2)) // O
          .place(GamePlayer.player2, Position(2, 0)) // O
          .place(GamePlayer.player1, Position(2, 1)) // X
          .place(GamePlayer.player1, Position(2, 2)); // X

      expect(board.isFull, true);
    });

    test('winner detects row wins', () {
      // Test each row
      for (var row = 0; row < 3; row++) {
        var board = Board.empty();
        for (var col = 0; col < 3; col++) {
          board = board.place(GamePlayer.player1, Position(row, col));
        }
        expect(board.winner, GamePlayer.player1);
      }
    });

    test('winner detects column wins', () {
      // Test each column
      for (var col = 0; col < 3; col++) {
        var board = Board.empty();
        for (var row = 0; row < 3; row++) {
          board = board.place(GamePlayer.player2, Position(row, col));
        }
        expect(board.winner, GamePlayer.player2);
      }
    });

    test('winner detects diagonal wins', () {
      // Test main diagonal (top-left to bottom-right)
      var board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player1, Position(1, 1))
          .place(GamePlayer.player1, Position(2, 2));
      expect(board.winner, GamePlayer.player1);

      // Test anti-diagonal (top-right to bottom-left)
      board = Board.empty()
          .place(GamePlayer.player2, Position(0, 2))
          .place(GamePlayer.player2, Position(1, 1))
          .place(GamePlayer.player2, Position(2, 0));
      expect(board.winner, GamePlayer.player2);
    });

    test('winner returns null when no winner', () {
      final board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player2, Position(1, 1));

      expect(board.winner, null);
    });

    test('isTerminal returns true when there is a winner', () {
      final board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player1, Position(0, 1))
          .place(GamePlayer.player1, Position(0, 2));

      expect(board.isTerminal, true);
    });

    test('isTerminal returns true when board is full', () {
      // Create a draw
      var board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player2, Position(0, 1))
          .place(GamePlayer.player1, Position(0, 2))
          .place(GamePlayer.player1, Position(1, 0))
          .place(GamePlayer.player2, Position(1, 1))
          .place(GamePlayer.player2, Position(1, 2))
          .place(GamePlayer.player2, Position(2, 0))
          .place(GamePlayer.player1, Position(2, 1))
          .place(GamePlayer.player1, Position(2, 2));

      expect(board.isTerminal, true);
    });

    test('place throws when game already has winner', () {
      final board = Board.empty()
          .place(GamePlayer.player1, Position(0, 0))
          .place(GamePlayer.player1, Position(0, 1))
          .place(GamePlayer.player1, Position(0, 2));

      expect(
        () => board.place(GamePlayer.player2, Position(1, 1)),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('Move', () {
    test('creates move with correct properties', () {
      final move = Move(
        turn: 1,
        player: GamePlayer.player1,
        pos: Position(0, 0),
      );

      expect(move.turn, 1);
      expect(move.player, GamePlayer.player1);
      expect(move.pos, Position(0, 0));
    });

    test('toString returns formatted string', () {
      final move = Move(
        turn: 5,
        player: GamePlayer.player2,
        pos: Position(1, 2),
      );

      expect(move.toString(), '#5 player2 -> (1,2)');
    });
  });

  group('GameState', () {
    test('initial creates empty game', () {
      final state = GameState.initial();

      expect(state.board.cells.every((cell) => cell == null), true);
      expect(state.history.isEmpty, true);
      expect(state.nextPlayer, GamePlayer.player1);
    });

    test('initial can specify starting player', () {
      final state = GameState.initial(startingPlayer: GamePlayer.player2);

      expect(state.nextPlayer, GamePlayer.player2);
    });

    test('play makes a move and returns new state', () {
      final state = GameState.initial();
      final newState = state.play(Position(1, 1));

      expect(state.history.isEmpty, true);
      expect(newState.history.length, 1);
      expect(newState.board.at(Position(1, 1)), GamePlayer.player1);
      expect(newState.nextPlayer, GamePlayer.player2);
    });

    test('play throws when game is over', () {
      var state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 0))
          .play(Position(0, 1))
          .play(Position(1, 1))
          .play(Position(0, 2)); // Player1 wins

      expect(() => state.play(Position(2, 2)), throwsA(isA<StateError>()));
    });

    test('winner returns the winning player', () {
      var state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 0))
          .play(Position(0, 1))
          .play(Position(1, 1))
          .play(Position(0, 2)); // Player1 wins with top row

      expect(state.winner, GamePlayer.player1);
    });

    test('isDraw returns true for draw game', () {
      var state = GameState.initial()
          .play(Position(0, 0)) // X
          .play(Position(0, 1)) // O
          .play(Position(0, 2)) // X
          .play(Position(1, 0)) // O
          .play(Position(1, 2)) // X
          .play(Position(1, 1)) // O
          .play(Position(2, 1)) // X
          .play(Position(2, 2)) // O
          .play(Position(2, 0)); // X - Draw

      expect(state.isDraw, true);
      expect(state.winner, null);
    });

    test('isOver returns true when game is complete', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 0))
          .play(Position(0, 1))
          .play(Position(1, 1))
          .play(Position(0, 2)); // Player1 wins

      expect(state.isOver, true);
    });

    test('legalMoves returns empty when game is over', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 0))
          .play(Position(0, 1))
          .play(Position(1, 1))
          .play(Position(0, 2)); // Player1 wins

      expect(state.legalMoves.isEmpty, true);
    });

    test('legalMoves returns available positions', () {
      final state = GameState.initial()
          .play(Position(1, 1))
          .play(Position(0, 0));

      final legal = state.legalMoves.toList();
      expect(legal.length, 7);
      expect(legal.contains(Position(1, 1)), false);
      expect(legal.contains(Position(0, 0)), false);
    });

    test('rewind returns to initial state', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 1))
          .play(Position(2, 2));

      final rewound = state.rewind(0);
      expect(rewound.history.isEmpty, true);
      expect(rewound.board.cells.every((cell) => cell == null), true);
    });

    test('rewind returns to intermediate state', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 1))
          .play(Position(2, 2));

      final rewound = state.rewind(2);
      expect(rewound.history.length, 2);
      expect(rewound.board.at(Position(0, 0)), GamePlayer.player1);
      expect(rewound.board.at(Position(1, 1)), GamePlayer.player2);
      expect(rewound.board.at(Position(2, 2)), null);
    });

    test('rewind throws for invalid turn number', () {
      final state = GameState.initial().play(Position(0, 0));

      expect(() => state.rewind(-1), throwsA(isA<RangeError>()));
      expect(() => state.rewind(5), throwsA(isA<RangeError>()));
    });

    test('history is immutable', () {
      final state = GameState.initial().play(Position(0, 0));

      expect(
        () => state.history.add(
          Move(turn: 99, player: GamePlayer.player1, pos: Position(0, 0)),
        ),
        throwsUnsupportedError,
      );
    });

    test('move history tracks correct turn numbers', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 1))
          .play(Position(2, 2));

      expect(state.history[0].turn, 1);
      expect(state.history[1].turn, 2);
      expect(state.history[2].turn, 3);
    });

    test('move history tracks correct players', () {
      final state = GameState.initial()
          .play(Position(0, 0))
          .play(Position(1, 1))
          .play(Position(2, 2));

      expect(state.history[0].player, GamePlayer.player1);
      expect(state.history[1].player, GamePlayer.player2);
      expect(state.history[2].player, GamePlayer.player1);
    });
  });
}
