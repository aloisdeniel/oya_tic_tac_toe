import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayerScreen extends StatefulWidget {
  final String mode;

  const PlayerScreen({super.key, required this.mode});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _selectedCharacter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose your character',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCharacter = index;
                      });
                    },
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
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => context.push(
                  '/opponent?mode=${widget.mode}&unavailableCharacter=$_selectedCharacter'),
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
