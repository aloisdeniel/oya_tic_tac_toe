import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({super.key, required super.child, required this.data});

  final AppThemeData data;

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
