# Oya Tic Tac Toe Core

Pure Dart game logic and AI implementation for Tic Tac Toe variants, including classic and meta (Ultimate Tic Tac Toe) modes.

## Overview

This is a platform-agnostic Dart package containing all the game logic, rules, and AI implementations for Tic Tac Toe. It has zero dependencies on Flutter, making it suitable for server-side use, CLI tools, or any Dart environment.

## Features

- **Pure Dart:** No Flutter dependencies, works anywhere Dart runs
- **Immutable State:** Functional approach with immutable game states
- **Two Game Modes:**
  - Classic 3x3 Tic Tac Toe
  - Meta Tic Tac Toe (Ultimate Tic Tac Toe)
- **AI Opponents:** Minimax-based AI with alpha-beta pruning
- **Serialization:** JSON serialization with dart_mappable
- **Complete Game Logic:**
  - Win detection
  - Valid move checking
  - Game history tracking
  - Turn management

## Game Modes

### Classic Mode

Standard 3x3 Tic Tac Toe implemented with:
- Full game state management
- Win detection (rows, columns, diagonals)
- Draw detection
- Move history
- AI with multiple difficulty levels

### Meta Mode (Ultimate Tic Tac Toe)

A recursive version where:
- The board is a 3x3 grid of 3x3 Tic Tac Toe boards
- Your move determines which board your opponent must play in
- Winning a small board claims that position on the meta board
- Strategic depth with forced board selection
- Complete AI implementation for meta gameplay

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  oya_ttt_core:
    path: ../oya_ttt_core/  # Adjust path as needed
```

Or if published:

```yaml
dependencies:
  oya_ttt_core: ^1.0.0
```

## Usage

### Classic Game Example

```dart
import 'package:oya_ttt_core/oya_ttt_core.dart';

// Start a new game
var game = BasicGameState.initial();

// Play moves
game = game.play(Position(0, 0));  // Top-left
game = game.play(Position(1, 1));  // Center
game = game.play(Position(0, 1));  // Top-middle

// Check game status
if (game.isOver) {
  if (game.winner != null) {
    print('Winner: ${game.winner}');
  } else {
    print('Draw!');
  }
}

// Get valid moves
final validMoves = game.board.emptyPositions();
```

### AI Opponent

```dart
import 'package:oya_ttt_core/oya_ttt_core.dart';

// Create an AI player
final ai = BasicGameAI(depth: 9);  // Maximum difficulty

// Get AI move
final aiMove = ai.bestMove(game);

// Apply the move
game = game.play(aiMove);
```

### Meta Game Example

```dart
import 'package:oya_ttt_core/oya_ttt_core.dart';

// Start a meta game
var metaGame = MetaGameState.initial();

// Play a move (board position, cell position)
metaGame = metaGame.play(
  boardPos: Position(1, 1),  // Center board
  cellPos: Position(0, 0),    // Top-left cell
);

// Check which board is active
final activeBoard = metaGame.activeBoard;
if (activeBoard != null) {
  print('Must play in board: $activeBoard');
} else {
  print('Can play in any available board');
}

// Use AI for meta game
final metaAI = MetaGameAI(depth: 3);  // Lower depth for performance
final aiMove = metaAI.bestMove(metaGame);
metaGame = metaGame.play(
  boardPos: aiMove.boardPos,
  cellPos: aiMove.cellPos,
);
```

### Serialization

All game states are serializable:

```dart
// Serialize to JSON
final json = game.toJson();

// Deserialize from JSON
final restoredGame = BasicGameStateMapper.fromJson(json);

// Works with all types
final metaJson = metaGame.toJson();
final restoredMetaGame = MetaGameStateMapper.fromJson(metaJson);
```

## Architecture

### Core Types

- **`Game`** - Complete game with players and metadata
- **`GameState`** - Base class for game states
- **`BasicGameState`** - Classic 3x3 game state
- **`MetaGameState`** - Ultimate Tic Tac Toe game state
- **`Board`** - Represents a single 3x3 board
- **`Position`** - Row/column coordinate (0-2)
- **`GamePlayer`** - Player representation
- **`GamePlayerId`** - Player identifier (player1/player2)
- **`Character`** - Visual character representation

### AI Implementation

Both game modes include AI based on:
- Minimax algorithm with alpha-beta pruning
- Configurable search depth
- Optimal play at maximum depth
- Heuristic evaluation for incomplete games

## Testing

Run the test suite:

```bash
dart test
```

Tests include:
- Classic game logic and rules
- Meta game logic and rules
- AI move selection
- Win detection
- Edge cases and invalid moves

## Development

### Code Generation

This package uses `dart_mappable` for serialization. After modifying annotated classes, run:

```bash
dart run build_runner build
```

### Project Structure

```
lib/
├── src/
│   ├── game/
│   │   ├── classic/      # Classic mode implementation
│   │   │   ├── classic.dart
│   │   │   └── ai.dart
│   │   ├── meta/         # Meta mode implementation
│   │   │   ├── meta.dart
│   │   │   └── ai.dart
│   │   ├── game.dart     # Base game types
│   │   ├── player.dart   # Player types
│   │   └── character.dart
│   └── user.dart         # User profile
└── oya_ttt_core.dart     # Public API
```

## License

See the [LICENSE](../../LICENSE) file in the root of the repository.
