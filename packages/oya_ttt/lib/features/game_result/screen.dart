import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameResultScreen extends StatelessWidget {
  const GameResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Winner!',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple.shade200,
              child: const Text('P1', style: TextStyle(fontSize: 32)),
            ),
            const SizedBox(height: 16),
            const Text(
              'Player 1',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const Text(
              'Game Duration: 2:34',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => context.go('/game?mode=basic'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('New Game', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => context.push('/replay'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Watch Replay', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/home'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Quit', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
