# Oya Tic Tac Toe

A modern, multi-platform Tic Tac Toe game built with Flutter, featuring classic and meta game modes with AI opponents.

## Overview

This is a monorepo containing a sophisticated Tic Tac Toe implementation that goes beyond the traditional game. It includes both classic 3x3 Tic Tac Toe and "Meta" Tic Tac Toe (also known as Ultimate Tic Tac Toe), a recursive variant where each cell of the main board contains a full Tic Tac Toe game.

## Features

- **Two Game Modes:**
  - Classic 3x3 Tic Tac Toe
  - Meta Tic Tac Toe (Ultimate Tic Tac Toe) - a 3x3 grid of 3x3 boards
- **AI Opponents:** Built-in AI with multiple difficulty levels
- **Local Multiplayer:** Play against friends on the same device
- **User Profiles:** Create and customize player profiles with avatars
- **Internationalization:** Support for multiple languages (English, French)
- **Cross-Platform:** Runs on iOS, Android, Web, Windows, macOS, and Linux
- **Beautiful UI:** Custom themes, backgrounds, and character designs
- **Game History:** Track and review past games

## Project Structure

This is a monorepo with two main packages:

- **`packages/oya_ttt_core/`** - Pure Dart game logic and AI implementation
- **`packages/oya_ttt/`** - Flutter application with UI and platform-specific code

## Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.9.2 or higher

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/oya_tic_tac_toe.git
cd oya_tic_tac_toe
```

2. Install dependencies:
```bash
cd packages/oya_ttt
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Development

### Running Tests

Core logic tests:
```bash
cd packages/oya_ttt_core
dart test
```

Flutter app tests (including golden/snapshot tests):
```bash
cd packages/oya_ttt
flutter test
```

### Building

For your target platform:
```bash
cd packages/oya_ttt
flutter build [platform]  # apk, ios, web, windows, macos, linux
```

## Game Rules

### Classic Mode
Standard 3x3 Tic Tac Toe. Get three in a row (horizontally, vertically, or diagonally) to win.

### Meta Mode (Ultimate Tic Tac Toe)
- The game consists of 9 small Tic Tac Toe boards arranged in a 3x3 grid
- Your move determines which board your opponent must play in next
- If sent to a completed board, you can play on any available board
- Win a small board to claim that position on the meta board
- Win the meta board (three small boards in a row) to win the game

## License

See [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
