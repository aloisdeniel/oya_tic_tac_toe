import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReadyToStartScreen extends StatelessWidget {
  final String mode;

  const ReadyToStartScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ready to Start'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ready to Start',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              mode == 'basic' ? 'Basic Mode' : 'Meta Mode',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rules',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mode == 'basic'
                        ? 'Basic tic-tac-toe rules: Get three in a row to win!'
                        : 'Meta mode: Play tic-tac-toe within tic-tac-toe!',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.deepPurple.shade200,
                      child: const Text('P1'),
                    ),
                    const SizedBox(height: 8),
                    const Text('Player 1', style: TextStyle(fontSize: 16)),
                  ],
                ),
                const Text('VS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.deepPurple.shade200,
                      child: const Text('P2'),
                    ),
                    const SizedBox(height: 8),
                    const Text('Player 2', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/game?mode=$mode'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Start Game', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
