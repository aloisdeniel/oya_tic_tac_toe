import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Padding(
        padding: EdgeInsets.all(theme.spacing.regular),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Statistics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: theme.spacing.large),
            Card(
              child: Padding(
                padding: EdgeInsets.all(theme.spacing.medium),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade700,
                              ),
                            ),
                            const Text('Wins', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade700,
                              ),
                            ),
                            const Text(
                              'Losses',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: theme.spacing.regular),
                    const Divider(),
                    SizedBox(height: theme.spacing.regular),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const Text('Total Games'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              '0%',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Win Rate'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () => context.pop(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: theme.spacing.regular),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
