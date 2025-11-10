import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReplayScreen extends StatefulWidget {
  const ReplayScreen({super.key});

  @override
  State<ReplayScreen> createState() => _ReplayScreenState();
}

class _ReplayScreenState extends State<ReplayScreen> {
  int _currentTurn = 0;
  final int _maxTurns = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Replay'),
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        index < _currentTurn ? (index % 2 == 0 ? 'X' : 'O') : '',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Turn $_currentTurn of $_maxTurns',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _currentTurn > 0
                          ? () {
                              setState(() {
                                _currentTurn--;
                              });
                            }
                          : null,
                      child: const Text('Previous'),
                    ),
                    ElevatedButton(
                      onPressed: _currentTurn < _maxTurns
                          ? () {
                              setState(() {
                                _currentTurn++;
                              });
                            }
                          : null,
                      child: const Text('Next'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Quit Replay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
