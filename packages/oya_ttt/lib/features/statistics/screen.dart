import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/statistics/widgets/stat_tile.dart';
import 'package:oya_ttt/state/stats.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final statsAsync = ref.watch($userStatistics);

    return Background.room(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: statsAsync.when(
            data: (stats) => Padding(
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
                  Padding(
                    padding: EdgeInsets.all(theme.spacing.small),
                    child: Column(
                      spacing: theme.spacing.large,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: theme.spacing.large,
                          children: [
                            Expanded(
                              child: StatTile(
                                value: '${stats.wins}',
                                label: l10n.wins,
                                accent: theme.color.accents.clover,
                              ),
                            ),
                            Expanded(
                              child: StatTile(
                                value: '${stats.losses}',
                                label: l10n.losses,
                                accent: theme.color.accents.cross,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: theme.spacing.large,
                          children: [
                            Expanded(
                              child: StatTile(
                                value: '${stats.totalGames}',
                                label: l10n.totalGames,
                                accent: null,
                              ),
                            ),
                            Expanded(
                              child: StatTile(
                                value: '${stats.winRate.toStringAsFixed(1)}%',
                                label: l10n.winRate,
                                accent: stats.winRate < 50
                                    ? theme.color.accents.diamond
                                    : theme.color.accents.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SafeArea(
                    top: false,
                    minimum: EdgeInsets.all(theme.spacing.large),
                    child: Center(
                      child: AppButton(
                        style: FrameStyle.regular,
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text(l10n.back),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) =>
                Center(child: Text('Error loading statistics: $error')),
          ),
        ),
      ),
    );
  }
}
