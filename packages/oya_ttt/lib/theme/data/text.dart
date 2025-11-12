import 'package:flutter/widgets.dart';

class AppThemeTextData {
  const AppThemeTextData({
    required this.header1,
    required this.header2,
    required this.body,
    required this.footnote,
    required this.button,
  });
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle body;
  final TextStyle button;
  final TextStyle footnote;
}
