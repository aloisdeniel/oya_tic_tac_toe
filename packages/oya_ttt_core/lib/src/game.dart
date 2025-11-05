enum Player {
  player1,
  player2;

  Player get other => switch (this) {
    player1 => player2,
    player2 => player1,
  };
}

/// A board coordinate in 3x3 space.
class Position {
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

  @override
  bool operator ==(Object other) =>
      other is Position && other.row == row && other.col == col;

  @override
  int get hashCode => index;
}

/// Immutable 3x3 board.
/// Internally stored as a fixed-length List of Player? of length 9.
class Board {
  const Board(this._cells);

  /// Creates an empty board.
  factory Board.empty() =>
      Board(List<Player?>.filled(9, null, growable: false));

  final List<Player?> _cells; // length 9, never growable

  /// Reads the mark at a position (or null if empty).
  Player? at(Position p) => _cells[p.index];

  /// Places a mark and returns a new Board. Throws if illegal.
  Board place(Player m, Position p) {
    final idx = p.index;

    if (winner != null) {
      throw StateError('Game already has a winner: ${winner!.name}');
    }
    if (isFull) {
      throw StateError('Board is full.');
    }
    if (_cells[idx] != null) {
      throw StateError('Cell $p is already occupied.');
    }

    final next = List<Player?>.from(_cells, growable: false);
    next[idx] = m;
    return Board(next);
  }

  /// All empty positions.
  Iterable<Position> get emptyPositions sync* {
    for (var i = 0; i < 9; i++) {
      if (_cells[i] == null) yield Position.fromIndex(i);
    }
  }

  bool get isFull => !_cells.contains(null);

  /// Returns the winner if any, otherwise null.
  Player? get winner {
    for (final line in _winningLines) {
      final a = _cells[line[0]], b = _cells[line[1]], c = _cells[line[2]];
      if (a != null && a == b && b == c) return a;
    }
    return null;
  }

  /// True if the game cannot continue (win or draw).
  bool get isTerminal => winner != null || isFull;

  /// Convenience string for debugging.
  @override
  String toString() {
    String cell(int i) => switch (_cells[i]) {
      Player.player1 => 'X',
      Player.player2 => 'O',
      null => '.',
    };
    return '''
${cell(0)} ${cell(1)} ${cell(2)}
${cell(3)} ${cell(4)} ${cell(5)}
${cell(6)} ${cell(7)} ${cell(8)}
''';
  }

  @override
  bool operator ==(Object other) =>
      other is Board &&
      Iterable.generate(9).every((i) => other._cells[i] == _cells[i]);

  @override
  int get hashCode => Object.hashAll(_cells);

  // Winning line triplets (indices into _cells).
  static const List<List<int>> _winningLines = <List<int>>[
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
class Move {
  const Move({required this.turn, required this.player, required this.pos});

  final int turn; // 1-based move number
  final Player player; // who played this move
  final Position pos; // where they played

  @override
  String toString() => '#$turn ${player.name} -> ${pos.toString()}';

  @override
  bool operator ==(Object other) =>
      other is Move &&
      other.turn == turn &&
      other.player == player &&
      other.pos == pos;

  @override
  int get hashCode => Object.hash(turn, player, pos);
}

/// Full immutable game state with history.
class GameState {
  const GameState({
    required this.board,
    required this.history,
    required this.nextPlayer,
  });

  final Board board; // current board
  final List<Move> history; // complete chronological history
  final Player nextPlayer; // who goes next

  /// Start a fresh game (X starts).
  factory GameState.initial({Player startingPlayer = Player.player1}) =>
      GameState(
        board: Board.empty(),
        history: const <Move>[],
        nextPlayer: startingPlayer,
      );

  /// Play a move and return the next immutable GameState.
  GameState play(Position pos) {
    if (board.isTerminal) {
      throw StateError('Game is over.');
    }

    final newBoard = board.place(nextPlayer, pos);
    final move = Move(turn: history.length + 1, player: nextPlayer, pos: pos);

    // Create new immutable lists; do not expose internal mutability.
    final newHistory = List<Move>.unmodifiable([...history, move]);

    return GameState(
      board: newBoard,
      history: newHistory,
      nextPlayer: nextPlayer.other,
    );
  }

  /// Winner, or null if none yet.
  Player? get winner => board.winner;

  /// True if no winner and no spaces left.
  bool get isDraw => board.winner == null && board.isFull;

  /// True if the game is finished.
  bool get isOver => board.isTerminal;

  /// All legal next positions (empty squares) if not over.
  Iterable<Position> get legalMoves =>
      isOver ? const Iterable<Position>.empty() : board.emptyPositions;

  /// Jump (immutably) to a previous turn (0 = initial).
  GameState rewind(int toTurn) {
    if (toTurn < 0 || toTurn > history.length) {
      throw RangeError('toTurn must be between 0 and ${history.length}.');
    }
    var g = GameState.initial(
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

  @override
  bool operator ==(Object other) =>
      other is GameState &&
      other.board == board &&
      other.nextPlayer == nextPlayer &&
      _listEquals(other.history, history);

  @override
  int get hashCode => Object.hash(board, nextPlayer, Object.hashAll(history));
}

// Simple list deep equality (to avoid extra deps).
bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
