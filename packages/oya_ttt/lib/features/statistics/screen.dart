import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.statisticsTitle)),
      body: Padding(
        padding: EdgeInsets.all(theme.spacing.regular),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.yourStatistics,
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
                            Text(l10n.wins, style: TextStyle(fontSize: 18)),
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
                            Text(
                              l10n.losses,
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
                            Text(l10n.totalGames),
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
                            Text(l10n.winRate),
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
                child: Text(
                  l10n.backToHome,
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
