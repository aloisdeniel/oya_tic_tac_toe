import 'package:flutter/widgets.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class AppThemeColorData {
  const AppThemeColorData({
    required this.main,
    required this.highlight,
    required this.accents,
  });
  final AppThemeMainColorData main;
  final AppThemeMainColorData highlight;
  final AppThemeAccentsColorData accents;
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

  AppThemeAccentColorData call(GameCharacter character) {
    return switch (character) {
      GameCharacter.circle => circle,
      GameCharacter.cross => cross,
      GameCharacter.spade => spade,
      GameCharacter.clover => clover,
      GameCharacter.heart => heart,
      GameCharacter.diamond => diamond,
    };
  }
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
