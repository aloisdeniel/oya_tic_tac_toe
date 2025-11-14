import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/users.dart';
import 'package:oya_ttt/widgets/gradient_page_transition.dart';
import 'features/onboarding/screen.dart';
import 'features/home/screen.dart';
import 'features/settings/screen.dart';
import 'features/game/screen.dart';
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
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: GradientPageTransition.horizontal,
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: GradientPageTransition.horizontal,
        ),
      ),
      GoRoute(
        path: '/game',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: GameScreen(),
          transitionsBuilder: GradientPageTransition.horizontal,
        ),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsScreen(),
          transitionsBuilder: GradientPageTransition.vertical,
        ),
      ),
      GoRoute(
        path: '/statistics',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const StatisticsScreen(),
          transitionsBuilder: GradientPageTransition.vertical,
        ),
      ),
    ],
  );
});
