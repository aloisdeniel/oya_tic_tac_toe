import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Oyattt',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () => context.push('/pick-mode'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    child: Text('New Game', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () => context.push('/statistics'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    child: Text('Statistics', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: InkWell(
              onTap: () => context.push('/settings'),
              child: Row(
                children: [
                  const Text('User Name', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.deepPurple.shade200,
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
