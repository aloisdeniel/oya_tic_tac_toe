import 'package:dart_mappable/dart_mappable.dart';
import 'package:oya_ttt_core/src/modes/basic/game.dart';

part 'game.mapper.dart';

/// A position in the meta game, referencing both a board and a cell within it.
@MappableClass()
class MetaPosition with MetaPositionMappable {
  const MetaPosition(this.boardPos, this.cellPos);

  /// Position of the board in the 3x3 meta grid.
  final Position boardPos;

  /// Position of the cell within that board.
  final Position cellPos;

  @override
  String toString() => 'Meta[board:$boardPos, cell:$cellPos]';
}

/// One move in the meta game.
@MappableClass()
class MetaMove with MetaMoveMappable {
  const MetaMove({required this.turn, required this.player, required this.pos});

  final int turn; // 1-based move number
  final GamePlayer player; // who played this move
  final MetaPosition pos; // where they played

  @override
  String toString() => '#$turn ${player.name} -> $pos';
}

/// Immutable meta tic-tac-toe game state.
///
/// Meta tic-tac-toe consists of a 3x3 grid of 3x3 tic-tac-toe boards.
/// - Winning a small board claims that position on the meta board.
/// - Your opponent's move determines which board you must play in next.
/// - If sent to a completed board, you can play on any available board.
/// - Win by getting three-in-a-row on the meta board.
@MappableClass()
class MetaGameState with MetaGameStateMappable {
  const MetaGameState({
    required this.boards,
    required this.metaBoard,
    required this.history,
    required this.nextPlayer,
    required this.activeBoard,
  });

  /// The 9 individual tic-tac-toe boards (indexed by Position).
  final Map<Position, Board> boards;

  /// The meta board tracking which player won each small board.
  final Board metaBoard;

  /// Complete chronological history of moves.
  final List<MetaMove> history;

  /// Who goes next.
  final GamePlayer nextPlayer;

  /// Which board position the next player must play in (null = any available).
  final Position? activeBoard;

  /// Start a fresh meta game.
  factory MetaGameState.initial({
    GamePlayer startingPlayer = GamePlayer.player1,
  }) {
    final boards = <Position, Board>{};
    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 3; col++) {
        boards[Position(row, col)] = Board.empty();
      }
    }

    return MetaGameState(
      boards: boards,
      metaBoard: Board.empty(),
      history: const <MetaMove>[],
      nextPlayer: startingPlayer,
      activeBoard: null, // can play anywhere initially
    );
  }

  /// Play a move and return the next immutable MetaGameState.
  MetaGameState play(MetaPosition pos) {
    if (isOver) {
      throw StateError('Meta game is over.');
    }

    // Check if move is in the correct board.
    if (activeBoard != null && pos.boardPos != activeBoard) {
      throw StateError(
        'Must play in board $activeBoard, but tried to play in ${pos.boardPos}.',
      );
    }

    // Check if the target board is already won.
    if (metaBoard.at(pos.boardPos) != null) {
      throw StateError('Board ${pos.boardPos} is already won.');
    }

    final targetBoard = boards[pos.boardPos]!;

    // Check if the cell is available.
    if (targetBoard.at(pos.cellPos) != null) {
      throw StateError(
        'Cell ${pos.cellPos} in board ${pos.boardPos} is occupied.',
      );
    }

    // Make the move on the small board.
    final newBoard = targetBoard.place(nextPlayer, pos.cellPos);
    final newBoards = Map<Position, Board>.from(boards);
    newBoards[pos.boardPos] = newBoard;

    // Update meta board if small board was just won.
    var newMetaBoard = metaBoard;
    if (newBoard.winner != null) {
      newMetaBoard = metaBoard.place(newBoard.winner!, pos.boardPos);
    }

    // Determine next active board.
    // Rule: opponent must play in the board corresponding to the cell just played.
    Position? nextActive = pos.cellPos;

    // If that board is already won or full, player can choose any available board.
    final targetNextBoard = newBoards[nextActive]!;
    if (newMetaBoard.at(nextActive) != null || targetNextBoard.isFull) {
      nextActive = null;
    }

    final move = MetaMove(
      turn: history.length + 1,
      player: nextPlayer,
      pos: pos,
    );

    final newHistory = List<MetaMove>.unmodifiable([...history, move]);

    return MetaGameState(
      boards: newBoards,
      metaBoard: newMetaBoard,
      history: newHistory,
      nextPlayer: nextPlayer.other,
      activeBoard: nextActive,
    );
  }

  /// Winner of the meta game, or null if none yet.
  GamePlayer? get winner => metaBoard.winner;

  /// True if no winner and all boards are complete.
  bool get isDraw => metaBoard.winner == null && metaBoard.isFull;

  /// True if the meta game is finished.
  bool get isOver => metaBoard.isTerminal;

  /// All legal next moves for the current player.
  Iterable<MetaPosition> get legalMoves sync* {
    if (isOver) return;

    // If there's an active board constraint, only consider that board.
    final boardsToCheck = activeBoard != null
        ? [activeBoard!]
        : boards.keys.where((pos) => metaBoard.at(pos) == null);

    for (final boardPos in boardsToCheck) {
      final board = boards[boardPos]!;
      for (final cellPos in board.emptyPositions) {
        yield MetaPosition(boardPos, cellPos);
      }
    }
  }

  /// Jump (immutably) to a previous turn (0 = initial).
  MetaGameState rewind(int toTurn) {
    if (toTurn < 0 || toTurn > history.length) {
      throw RangeError('toTurn must be between 0 and ${history.length}.');
    }

    var g = MetaGameState.initial(
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
        : 'Next: ${nextPlayer.name.toUpperCase()}${activeBoard != null ? ' (must play in $activeBoard)' : ''}';

    final buffer = StringBuffer();
    buffer.writeln('MetaGameState($status, turns=${history.length})');
    buffer.writeln();

    // Print the 9 boards in a 3x3 layout.
    for (var metaRow = 0; metaRow < 3; metaRow++) {
      // Each board has 3 rows, print them line by line.
      for (var boardRow = 0; boardRow < 3; boardRow++) {
        for (var metaCol = 0; metaCol < 3; metaCol++) {
          final boardPos = Position(metaRow, metaCol);
          final board = boards[boardPos]!;

          for (var boardCol = 0; boardCol < 3; boardCol++) {
            final cellPos = Position(boardRow, boardCol);
            final cell = board.at(cellPos);
            final char = switch (cell) {
              GamePlayer.player1 => 'X',
              GamePlayer.player2 => 'O',
              null => '.',
            };
            buffer.write(char);
          }

          // Add separator between boards.
          if (metaCol < 2) {
            buffer.write(' | ');
          }
        }
        buffer.writeln();
      }

      // Add horizontal separator between board rows.
      if (metaRow < 2) {
        buffer.writeln('-----------+-----------+-----------');
      }
    }

    buffer.writeln();
    buffer.write('Meta Board:\n${metaBoard.toString()}');

    return buffer.toString();
  }
}
