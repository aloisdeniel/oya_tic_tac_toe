import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/data/color.dart';
import 'package:oya_ttt/theme/data/data.dart';
import 'package:oya_ttt/theme/data/spacing.dart';
import 'package:oya_ttt/theme/data/text.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';
import 'package:oya_ttt/widgets/base/responsive.dart';

class AppTheme extends InheritedWidget {
  AppTheme({super.key, required Widget child, required this.data})
    : super(
        child: DefaultForeground(
          foreground: data.color.main.foreground,
          textStyle: data.text.body,
          child: child,
        ),
      );

  factory AppTheme.dark({
    required BuildContext context,
    required Widget child,
  }) {
    final layout = Responsive.of(context);
    const color = AppThemeColorData.dark();
    return AppTheme(
      data: AppThemeData(
        id: '${layout.name}_dark',
        text: switch (layout) {
          LayoutMode.regular => AppThemeTextData.regular(),
          LayoutMode.small => AppThemeTextData.small(),
        },
        spacing: switch (layout) {
          LayoutMode.regular => AppThemeSpacingData.regular(),
          LayoutMode.small => AppThemeSpacingData.small(),
        },
        color: color,
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
    return data.id != oldWidget.data.id;
  }
}
