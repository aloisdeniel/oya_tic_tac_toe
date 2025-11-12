import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/users.dart';
import 'features/onboarding/screen.dart';
import 'features/home/screen.dart';
import 'features/settings/screen.dart';
import 'features/game/screen.dart';
import 'features/game_result/screen.dart';
import 'features/statistics/screen.dart';

final $initialLocation = FutureProvider((ref) async {
  final user = await ref.read($user.future);
  if (user == null) return '/onboarding';

  final game = await ref.read($currentGame.future);
  if (game == null) return '/home';

  return '/game?id=${game.id}';
});

final $appRouter = FutureProvider((ref) async {
  final logger = Logger('Router');
  var initialLocation = '/onboarding';
  try {
    initialLocation = await ref.watch($initialLocation.future);
  } catch (e, st) {
    logger.severe('Failed to init router', e, st);
  }
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) {
          return GameScreen();
        },
      ),
      GoRoute(
        path: '/game-result',
        builder: (context, state) => const GameResultScreen(),
      ),
      GoRoute(
        path: '/statistics',
        builder: (context, state) => const StatisticsScreen(),
      ),
    ],
  );
});
