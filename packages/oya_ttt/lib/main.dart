import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/features/init/screen.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';

void main() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
  runApp(const OyatttApp());
}

class OyatttApp extends StatelessWidget {
  const OyatttApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AppTheme.dark(
        child: Init(
          builder: (context, init, _) {
            return MaterialApp.router(
              title: 'Oyattt',
              routerConfig: init.router,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, child) {
                return Breakpoints(minRegularWidth: 700, child: child!);
              },
            );
          },
        ),
      ),
    );
  }
}
