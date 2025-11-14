import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oya_ttt/features/edit_user/screen.dart';
import 'package:oya_ttt/features/game/screen.dart';
import 'package:oya_ttt/features/home/screen.dart';
import 'package:oya_ttt/features/onboarding/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oya_ttt/features/pick_character/screen.dart';
import 'package:oya_ttt/features/pick_mode/screen.dart';
import 'package:oya_ttt/features/ready_to_start/screen.dart';
import 'package:oya_ttt/features/settings/screen.dart';
import 'package:oya_ttt/features/statistics/screen.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/settings.dart';
import 'package:oya_ttt/state/stats.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:snaptest/snaptest.dart';

import 'data.dart' as data;
import 'precache_assets.dart';

void main() {
  testScreen('onboarding', (context) {
    return OnboardingScreen();
  });

  testScreen('pick_character', (context) {
    return PickCharacterModal(status: Text('New user'));
  });

  testScreen('edit_user', (context) {
    return EditUserModal();
  });

  testScreen(
    'home',
    overrides: [$user.overrideWithValue(AsyncData(data.user))],
    (context) {
      return HomeScreen();
    },
  );

  testScreen(
    'settings',
    overrides: [$user.overrideWithValue(AsyncData(data.user))],
    (context) {
      return SettingsScreen();
    },
  );

  testScreen('pick_mode', (context) {
    return PickModeModal(status: Text('New game'));
  });

  testScreen('ready_to_start', overrides: [], (context) {
    return ReadyToStartModal(game: data.emptyBasicGame);
  });

  testScreen(
    'game_empty',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.emptyBasicGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );

  testScreen(
    'game_ingame',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.inGameBasicGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );
  testScreen(
    'game_won_p1',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.p1WonBasicGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );
  testScreen(
    'game_won_p2',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.p2WonBasicGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );

  testScreen(
    'stats',
    overrides: [
      $userStatistics.overrideWith((ref) {
        return data.stats;
      }),
    ],
    (context) {
      return StatisticsScreen();
    },
  );

  // Meta game tests
  testScreen(
    'meta_game_empty',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.emptyMetaGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );

  testScreen(
    'meta_game_ingame',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.inGameMetaGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );

  testScreen(
    'meta_game_won_p1',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.p1WonMetaGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );

  testScreen(
    'meta_game_won_p2',
    overrides: [
      $currentGame.overrideWithBuild((ref, _) {
        return data.p2WonMetaGame;
      }),
    ],
    (context) {
      return GameScreen();
    },
  );
}

void testScreen(
  String description,
  Widget Function(BuildContext context) builder, {
  Duration pumpAfter = const Duration(milliseconds: 10000),
  List<Override> overrides = const [],
}) {
  const devices = {'small': Size(600, 1280), 'regular': Size(1280, 920)};
  for (var device in devices.entries) {
    testWidgets(description, (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = device.value;
      final root = GlobalKey();
      await tester.pumpWidget(
        ProviderScope(
          key: root,
          overrides: [
            $userSettings.overrideWithBuild((ref, value) {
              return UserSettings(
                hapticFeedback: true,
                disableVisualEffects: true,
              );
            }),
            ...overrides,
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('fr')],
            builder: (context, child) {
              return Breakpoints(
                minRegularWidth: 700,
                child: Builder(
                  builder: (context) {
                    return AppTheme.dark(context: context, child: child!);
                  },
                ),
              );
            },
            home: Builder(builder: builder),
          ),
        ),
      );

      await tester.runAsync(() async {
        await loadFontsAndIcons();
        await precacheAllAssets(tester.binding.rootElement!);
      });

      final binding = TestWidgetsFlutterBinding.instance;
      final endTime = binding.clock.fromNowBy(pumpAfter);
      do {
        if (binding.clock.now().isAfter(endTime)) {
          break;
        }
        await binding.pump(
          const Duration(milliseconds: 100),
          EnginePhase.sendSemanticsUpdate,
        );
      } while (binding.hasScheduledFrame);

      await expectLater(
        find.byKey(root),
        matchesGoldenFile('screenshots/${device.key}/$description.png'),
      );
    });
  }
}
