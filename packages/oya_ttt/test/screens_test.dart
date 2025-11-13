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
import 'package:oya_ttt/l10n/app_localizations.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/settings.dart';
import 'package:oya_ttt/state/stats.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:snaptest/snaptest.dart';

import 'data.dart' as data;

void main() {
  testScreen('onboarding', preloadBackground: [BackgroundIllustration.city2], (
    context,
  ) {
    return OnboardingScreen();
  });

  testScreen(
    'pick_character',
    preloadBackground: [BackgroundIllustration.room2],
    (context) {
      return PickCharacterModal(status: Text('New user'));
    },
  );

  testScreen('edit_user', preloadBackground: [BackgroundIllustration.room2], (
    context,
  ) {
    return EditUserModal();
  });

  testScreen(
    'home',
    preloadBackground: [BackgroundIllustration.room],
    overrides: [$user.overrideWithValue(AsyncData(data.user))],
    (context) {
      return HomeScreen();
    },
  );

  testScreen(
    'settings',
    preloadBackground: [BackgroundIllustration.room2],
    overrides: [$user.overrideWithValue(AsyncData(data.user))],
    (context) {
      return SettingsScreen();
    },
  );

  testScreen(
    'pick_mode',
    preloadBackground: [BackgroundIllustration.elevator],
    (context) {
      return PickModeModal(status: Text('New game'));
    },
  );

  testScreen(
    'ready_to_start',
    preloadBackground: [BackgroundIllustration.elevator],
    overrides: [],
    (context) {
      return ReadyToStartModal(game: data.emptyBasicGame);
    },
  );

  testScreen(
    'game_empty',
    preloadBackground: [BackgroundIllustration.screens],
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
    preloadBackground: [BackgroundIllustration.screens],
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
    preloadBackground: [BackgroundIllustration.screens],
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
    preloadBackground: [BackgroundIllustration.screens],
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
    preloadBackground: [BackgroundIllustration.screens],
    overrides: [
      $userStatistics.overrideWith((ref) {
        return data.stats;
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
  Duration pumpAfter = const Duration(milliseconds: 8000),
  List<Override> overrides = const [],
  List<GameCharacter> preloadCharacters = const [
    GameCharacter.circle,
    GameCharacter.cross,
    GameCharacter.robot,
  ],
  List<BackgroundIllustration> preloadBackground = const [],
}) {
  testWidgets(description, (tester) async {
    await tester.runAsync(() async {
      for (var char in preloadCharacters) {
        await precacheImage(
          AssetImage('assets/avatar/${char.name}.png'),
          tester.binding.rootElement!,
        );
        await precacheImage(
          AssetImage('assets/character/${char.name}.png'),
          tester.binding.rootElement!,
        );
      }
      for (var illustration in preloadBackground) {
        await precacheImage(
          AssetImage('assets/background/${illustration.name}.png'),
          tester.binding.rootElement!,
        );
      }
    });
    final settings = SnaptestSettings.rendered(
      devices: [Devices.ios.iPhone16, Devices.macOS.macBookPro],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          $userSettings.overrideWithBuild((ref, value) {
            return UserSettings(
              hapticFeedback: true,
              disableVisualEffects: false,
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

    tester.pumpAndSettle(pumpAfter);

    await snap(matchToGolden: true, settings: settings);
  });
}
