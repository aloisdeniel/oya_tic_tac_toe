import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PickModeScreen extends StatefulWidget {
  const PickModeScreen({super.key});

  @override
  State<PickModeScreen> createState() => _PickModeScreenState();
}

class _PickModeScreenState extends State<PickModeScreen> {
  String _selectedMode = 'basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Game Mode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            RadioListTile<String>(
              title: const Text('Basic Mode'),
              value: 'basic',
              groupValue: _selectedMode,
              onChanged: (value) {
                setState(() {
                  _selectedMode = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Meta Mode'),
              value: 'meta',
              groupValue: _selectedMode,
              onChanged: (value) {
                setState(() {
                  _selectedMode = value!;
                });
              },
            ),
            const SizedBox(height: 24),
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
                    _selectedMode == 'basic'
                        ? 'Basic tic-tac-toe rules: Get three in a row to win!'
                        : 'Meta mode: Play tic-tac-toe within tic-tac-toe!',
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/player?mode=$_selectedMode'),
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
