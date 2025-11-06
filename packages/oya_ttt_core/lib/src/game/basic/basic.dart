import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/src/game/game.dart';
import 'package:oya_ttt_core/src/game/player.dart';

part 'basic.mapper.dart';

/// Full immutable game state with history.
@MappableClass()
class BasicGameState extends GameState with BasicGameStateMappable {
  const BasicGameState({
    required this.board,
    required this.history,
    required this.nextPlayer,
  });

  /// Start a fresh game (X starts).
  factory BasicGameState.initial({
    GamePlayerId startingPlayer = GamePlayerId.player1,
  }) => BasicGameState(
    board: Board.empty(),
    history: const <Move>[],
    nextPlayer: startingPlayer,
  );

  /// Play a move and return the next immutable GameState.
  BasicGameState play(Position pos) {
    if (board.isTerminal) {
      throw StateError('Game is over.');
    }

    final newBoard = board.place(nextPlayer, pos);
    final move = Move(turn: history.length + 1, player: nextPlayer, pos: pos);

    // Create new immutable lists; do not expose internal mutability.
    final newHistory = List<Move>.unmodifiable([...history, move]);

    return BasicGameState(
      board: newBoard,
      history: newHistory,
      nextPlayer: nextPlayer.other,
    );
  }

  final Board board; // current board
  final List<Move> history; // complete chronological history

  @override
  final GamePlayerId nextPlayer; // who goes next

  /// Winner, or null if none yet.
  @override
  GamePlayerId? get winner => board.winner;

  /// True if no winner and no spaces left.
  @override
  bool get isDraw => board.winner == null && board.isFull;

  /// True if the game is finished.
  @override
  bool get isOver => board.isTerminal;

  /// All legal next positions (empty squares) if not over.
  Iterable<Position> get legalMoves =>
      isOver ? const Iterable<Position>.empty() : board.emptyPositions;

  /// Jump (immutably) to a previous turn (0 = initial).
  BasicGameState rewind(int toTurn) {
    if (toTurn < 0 || toTurn > history.length) {
      throw RangeError('toTurn must be between 0 and ${history.length}.');
    }
    var g = BasicGameState.initial(
      startingPlayer: history.isEmpty ? nextPlayer : history.first.player,
    );
    for (var i = 0; i < toTurn; i++) {
      g = g.play(history[i].pos);
    }
    return g;
  }

  @override
  String toString() {
    final status = winner != null
        ? 'Winner: ${winner!.name.toUpperCase()}'
        : isDraw
        ? 'Draw'
        : 'Next: ${nextPlayer.name.toUpperCase()}';
    return 'GameState($status, turns=${history.length})\n$board';
  }
}

/// A board coordinate in 3x3 space.
@MappableClass()
class Position with PositionMappable {
  const Position(this.row, this.col)
    : assert(row >= 0 && row < 3),
      assert(col >= 0 && col < 3);

  factory Position.fromIndex(int i) {
    assert(i >= 0 && i < 9);
    return Position(i ~/ 3, i % 3);
  }

  final int row; // 0..2
  final int col; // 0..2

  int get index => row * 3 + col;

  @override
  String toString() => '($row,$col)';
}

/// Immutable 3x3 board.
/// Internally stored as a fixed-length List of Player? of length 9.
@MappableClass()
class Board with BoardMappable {
  const Board(this.cells);

  /// Creates an empty board.
  factory Board.empty() =>
      Board(List<GamePlayerId?>.filled(9, null, growable: false));

  final List<GamePlayerId?> cells; // length 9, never growable

  /// Reads the mark at a position (or null if empty).
  GamePlayerId? at(Position p) => cells[p.index];

  /// Places a mark and returns a new Board. Throws if illegal.
  Board place(GamePlayerId m, Position p) {
    final idx = p.index;

    if (winner != null) {
      throw StateError('Game already has a winner: ${winner!.name}');
    }
    if (isFull) {
      throw StateError('Board is full.');
    }
    if (cells[idx] != null) {
      throw StateError('Cell $p is already occupied.');
    }

    final next = List<GamePlayerId?>.from(cells, growable: false);
    next[idx] = m;
    return Board(next);
  }

  /// All empty positions.
  Iterable<Position> get emptyPositions sync* {
    for (var i = 0; i < 9; i++) {
      if (cells[i] == null) yield Position.fromIndex(i);
    }
  }

  bool get isFull => !cells.contains(null);

  /// Returns the winner if any, otherwise null.
  GamePlayerId? get winner {
    for (final line in winningLines) {
      final a = cells[line[0]], b = cells[line[1]], c = cells[line[2]];
      if (a != null && a == b && b == c) return a;
    }
    return null;
  }

  /// True if the game cannot continue (win or draw).
  bool get isTerminal => winner != null || isFull;

  /// Convenience string for debugging.
  @override
  String toString() {
    String cell(int i) => switch (cells[i]) {
      GamePlayerId.player1 => 'X',
      GamePlayerId.player2 => 'O',
      null => '.',
    };
    return '''
${cell(0)} ${cell(1)} ${cell(2)}
${cell(3)} ${cell(4)} ${cell(5)}
${cell(6)} ${cell(7)} ${cell(8)}
''';
  }

  // Winning line triplets (indices into _cells).
  static const List<List<int>> winningLines = <List<int>>[
    // rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // cols
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // diagonals
    [0, 4, 8],
    [2, 4, 6],
  ];
}

/// One move in the game.
@MappableClass()
class Move with MoveMappable {
  const Move({required this.turn, required this.player, required this.pos});

  final int turn; // 1-based move number
  final GamePlayerId player; // who played this move
  final Position pos; // where they played

  @override
  String toString() => '#$turn ${player.name} -> ${pos.toString()}';
}
