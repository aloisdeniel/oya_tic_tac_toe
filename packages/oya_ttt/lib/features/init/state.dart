import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/router.dart';
import 'package:oya_ttt/state/games.dart';
import 'package:oya_ttt/state/services.dart';
import 'package:oya_ttt/state/users.dart';

class InitData {
  const InitData({required this.router});
  final GoRouter router;
}

final $init = Provider<AsyncValue<InitData>>((ref) {
  // We preload many async providers to avoid any "jank" on first page.
  final preloaded = [
    // Services
    ref.watch($logger),
    // Data
    ref.watch($users),
    ref.watch($currentGame),
  ];
  if (preloaded.any((x) => x is AsyncLoading)) {
    return AsyncLoading<InitData>();
  }
  final appRouter = ref.watch($appRouter);
  return appRouter.whenData((router) {
    return InitData(router: router);
  });
});
