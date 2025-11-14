import 'package:oya_ttt/theme/data/color.dart';
import 'package:oya_ttt/theme/data/spacing.dart';
import 'package:oya_ttt/theme/data/text.dart';

class AppThemeData {
  const AppThemeData({
    required this.id,
    required this.color,
    required this.text,
    required this.spacing,
  });

  final String id;
  final AppThemeColorData color;
  final AppThemeTextData text;
  final AppThemeSpacingData spacing;
}
