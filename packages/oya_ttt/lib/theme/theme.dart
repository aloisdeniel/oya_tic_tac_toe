import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/data/color.dart';
import 'package:oya_ttt/theme/data/data.dart';
import 'package:oya_ttt/theme/data/text.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';

class AppTheme extends InheritedWidget {
  AppTheme({super.key, required Widget child, required this.data})
    : super(
        child: DefaultForeground(
          foreground: data.color.main.foreground,
          textStyle: data.text.body,
          child: child,
        ),
      );

  factory AppTheme.dark({required Widget child}) {
    return AppTheme(
      data: AppThemeData(
        text: AppThemeTextData(
          header1: TextStyle(
            fontFamily: 'Tilt Warp',
            fontSize: 72,
            decoration: TextDecoration.none,
          ),
          header2: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 44,
            decoration: TextDecoration.none,
          ),
          body: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
          button: TextStyle(
            fontFamily: 'Tilt Warp',
            fontSize: 32,
            decoration: TextDecoration.none,
          ),
        ),
        color: const AppThemeColorData(
          main: AppThemeMainColorData(
            background: Color(0xFF0F1A29),
            foreground: Color(0xFFFFFFFF),
            foregroundSecondary: Color(0xFFCEC7EA),
          ),
          highlight: AppThemeMainColorData(
            background: Color(0xFFFFFFFF),
            foreground: Color(0xFF0F1A29),
            foregroundSecondary: Color(0xFF0F1A29),
          ),
          accent: AppThemeAccentsColorData(
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
          ),
        ),
      ),
      child: child,
    );
  }

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
