import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Choose your favorite character',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.deepPurple.shade200,
                        child: Text('C${index + 1}'),
                      ),
                      const SizedBox(height: 8),
                      Text('Char ${index + 1}'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => context.go('/home'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Text('Create'),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
