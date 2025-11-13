import 'package:flutter/widgets.dart';

class AppThemeTextData {
  const AppThemeTextData({
    required this.header1,
    required this.header2,
    required this.body,
    required this.footnote,
    required this.button,
  });

  AppThemeTextData.regular()
    : header1 = TextStyle(
        fontFamily: 'Tilt Warp',
        fontSize: 72,
        decoration: TextDecoration.none,
      ),
      header2 = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 44,
        decoration: TextDecoration.none,
      ),
      body = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
      footnote = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 13,
        decoration: TextDecoration.none,
      ),
      button = TextStyle(
        fontFamily: 'Tilt Warp',
        fontSize: 32,
        decoration: TextDecoration.none,
      );

  AppThemeTextData.small()
    : header1 = TextStyle(
        fontFamily: 'Tilt Warp',
        fontSize: 42,
        decoration: TextDecoration.none,
      ),
      header2 = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 34,
        decoration: TextDecoration.none,
      ),
      body = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 14,
        decoration: TextDecoration.none,
      ),
      footnote = TextStyle(
        fontFamily: 'Lexend',
        fontSize: 11,
        decoration: TextDecoration.none,
      ),
      button = TextStyle(
        fontFamily: 'Tilt Warp',
        fontSize: 20,
        decoration: TextDecoration.none,
      );

  final TextStyle header1;
  final TextStyle header2;
  final TextStyle body;
  final TextStyle button;
  final TextStyle footnote;
}
