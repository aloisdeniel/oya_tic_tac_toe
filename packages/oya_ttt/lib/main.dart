import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme.dark(
      child: MaterialApp.router(
        title: 'Oyattt',
        builder: (context, child) {
          return Breakpoints(minRegularWidth: 700, child: child!);
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
