import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OpponentScreen extends StatefulWidget {
  final String mode;
  final int unavailableCharacter;

  const OpponentScreen({
    super.key,
    required this.mode,
    required this.unavailableCharacter,
  });

  @override
  State<OpponentScreen> createState() => _OpponentScreenState();
}

class _OpponentScreenState extends State<OpponentScreen> {
  String _opponentType = 'ai';
  int _selectedCharacter = 1;

  @override
  void initState() {
    super.initState();
    // Default to first available character
    _selectedCharacter = widget.unavailableCharacter == 0 ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Opponent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose opponent',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'ai', label: Text('AI')),
                ButtonSegment(value: 'user', label: Text('User')),
              ],
              selected: {_opponentType},
              onSelectionChanged: (value) {
                setState(() {
                  _opponentType = value.first;
                });
              },
            ),
            if (_opponentType == 'user') ...[
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => context.push('/users'),
                child: const Text('Select User'),
              ),
            ],
            const SizedBox(height: 32),
            const Text(
              'Choose opponent character',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final isUnavailable = index == widget.unavailableCharacter;
                  return GestureDetector(
                    onTap: isUnavailable
                        ? null
                        : () {
                            setState(() {
                              _selectedCharacter = index;
                            });
                          },
                    child: Opacity(
                      opacity: isUnavailable ? 0.3 : 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedCharacter == index
                                ? Colors.deepPurple
                                : Colors.grey,
                            width: _selectedCharacter == index ? 3 : 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.deepPurple.shade200,
                              child: Text('C${index + 1}'),
                            ),
                            const SizedBox(height: 8),
                            Text('Char ${index + 1}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => context.push('/ready-to-start?mode=${widget.mode}'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Continue', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
