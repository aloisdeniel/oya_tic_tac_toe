import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/onboarding/screen.dart';
import 'features/home/screen.dart';
import 'features/settings/screen.dart';
import 'features/users/screen.dart';
import 'features/create_user/screen.dart';
import 'features/pick_mode/screen.dart';
import 'features/player/screen.dart';
import 'features/opponent/screen.dart';
import 'features/ready_to_start/screen.dart';
import 'features/game/screen.dart';
import 'features/game_result/screen.dart';
import 'features/replay/screen.dart';
import 'features/statistics/screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersScreen(),
    ),
    GoRoute(
      path: '/create-user',
      builder: (context, state) => const CreateUserScreen(),
    ),
    GoRoute(
      path: '/pick-mode',
      builder: (context, state) => const PickModeScreen(),
    ),
    GoRoute(
      path: '/player',
      builder: (context, state) {
        final mode = state.uri.queryParameters['mode'] ?? 'basic';
        return PlayerScreen(mode: mode);
      },
    ),
    GoRoute(
      path: '/opponent',
      builder: (context, state) {
        final mode = state.uri.queryParameters['mode'] ?? 'basic';
        final unavailableCharacter =
            int.parse(state.uri.queryParameters['unavailableCharacter'] ?? '0');
        return OpponentScreen(
          mode: mode,
          unavailableCharacter: unavailableCharacter,
        );
      },
    ),
    GoRoute(
      path: '/ready-to-start',
      builder: (context, state) {
        final mode = state.uri.queryParameters['mode'] ?? 'basic';
        return ReadyToStartScreen(mode: mode);
      },
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) {
        final mode = state.uri.queryParameters['mode'] ?? 'basic';
        return GameScreen(mode: mode);
      },
    ),
    GoRoute(
      path: '/game-result',
      builder: (context, state) => const GameResultScreen(),
    ),
    GoRoute(
      path: '/replay',
      builder: (context, state) => const ReplayScreen(),
    ),
    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsScreen(),
    ),
  ],
);
