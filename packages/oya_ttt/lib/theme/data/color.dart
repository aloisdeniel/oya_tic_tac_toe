import 'package:flutter/widgets.dart';

enum AppAccentColor { circle, cross, spade, clover, heart, diamond }

class AppThemeColorData {
  const AppThemeColorData({
    required this.main,
    required this.highlight,
    required this.accent,
  });
  final AppThemeMainColorData main;
  final AppThemeMainColorData highlight;
  final AppThemeAccentsColorData accent;
}

class AppThemeMainColorData {
  const AppThemeMainColorData({
    required this.background,
    required this.foreground,
    required this.foregroundSecondary,
  });
  final Color background;
  final Color foreground;
  final Color foregroundSecondary;
}

class AppThemeAccentsColorData {
  const AppThemeAccentsColorData({
    required this.circle,
    required this.cross,
    required this.spade,
    required this.clover,
    required this.heart,
    required this.diamond,
  });

  final AppThemeAccentColorData circle;
  final AppThemeAccentColorData cross;
  final AppThemeAccentColorData spade;
  final AppThemeAccentColorData clover;
  final AppThemeAccentColorData heart;
  final AppThemeAccentColorData diamond;
}

class AppThemeAccentColorData {
  const AppThemeAccentColorData({
    required this.foreground,
    required this.foregroundOnHighlight,
    required this.backgroundSubtle,
  });
  final Color foreground;
  final Color foregroundOnHighlight;
  final Color backgroundSubtle;
}
