import 'package:flutter/widgets.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class AppThemeColorData {
  const AppThemeColorData({
    required this.main,
    required this.highlight,
    required this.accents,
  });
  const AppThemeColorData.dark()
    : main = const AppThemeMainColorData(
        background: Color(0xFF0F1A29),
        foreground: Color(0xFFFFFFFF),
        foregroundSecondary: Color(0xFFCEC7EA),
      ),
      highlight = const AppThemeMainColorData(
        background: Color(0xFFFFFFFF),
        foreground: Color(0xFF0F1A29),
        foregroundSecondary: Color(0xFF0F1A29),
      ),
      accents = const AppThemeAccentsColorData(
        circle: AppThemeAccentColorData(
          foreground: Color(0xFF64DEF2),
          foregroundOnHighlight: Color(0xFF64DEF2),
          backgroundSubtle: Color(0xFFE5FBFF),
        ),
        cross: AppThemeAccentColorData(
          foreground: Color(0xFFF0655A),
          foregroundOnHighlight: Color(0xFFF0655A),
          backgroundSubtle: Color(0xFFFFE7E5),
        ),
        spade: AppThemeAccentColorData(
          foreground: Color(0xFFC179D0),
          foregroundOnHighlight: Color(0xFFC179D0),
          backgroundSubtle: Color(0xFFFBE6FF),
        ),
        clover: AppThemeAccentColorData(
          foreground: Color(0xFF7DD89D),
          foregroundOnHighlight: Color(0xFF7DD89D),
          backgroundSubtle: Color(0xFFE7FFEF),
        ),
        heart: AppThemeAccentColorData(
          foreground: Color(0xFFFEB0AF),
          foregroundOnHighlight: Color(0xFFFEB0AF),
          backgroundSubtle: Color(0xFFFFE5E5),
        ),
        diamond: AppThemeAccentColorData(
          foreground: Color(0xFFFDB475),
          foregroundOnHighlight: Color(0xFFFDB475),
          backgroundSubtle: Color(0xFFFFEBD9),
        ),
        robot: AppThemeAccentColorData(
          foreground: Color(0xFFFFDE73),
          foregroundOnHighlight: Color(0xFFFFDE73),
          backgroundSubtle: Color(0xFFFFF9E7),
        ),
      );

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
    required this.robot,
  });

  final AppThemeAccentColorData circle;
  final AppThemeAccentColorData cross;
  final AppThemeAccentColorData spade;
  final AppThemeAccentColorData clover;
  final AppThemeAccentColorData heart;
  final AppThemeAccentColorData diamond;
  final AppThemeAccentColorData robot;

  AppThemeAccentColorData call(GameCharacter character) {
    return switch (character) {
      GameCharacter.circle => circle,
      GameCharacter.cross => cross,
      GameCharacter.spade => spade,
      GameCharacter.clover => clover,
      GameCharacter.heart => heart,
      GameCharacter.diamond => diamond,
      GameCharacter.robot => robot,
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
