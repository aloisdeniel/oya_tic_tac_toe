import 'package:flutter/widgets.dart';

enum LayoutMode { small, regular }

class LayoutModeProvider extends InheritedWidget {
  const LayoutModeProvider({
    super.key,
    required super.child,
    required this.layoutMode,
  });

  final LayoutMode layoutMode;

  static LayoutMode of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<LayoutModeProvider>();
    return widget!.layoutMode;
  }

  /// Returns the padding from the closest [DefaultPa
  @override
  bool updateShouldNotify(covariant LayoutModeProvider oldWidget) {
    return layoutMode != oldWidget.layoutMode;
  }
}

class Breakpoints extends StatelessWidget {
  const Breakpoints({
    super.key,
    required this.minRegularWidth,
    required this.child,
  });

  final double minRegularWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, layout) {
        return LayoutModeProvider(
          layoutMode: switch (layout.maxWidth) {
            final v when v < minRegularWidth => LayoutMode.small,
            _ => LayoutMode.regular,
          },
          child: child,
        );
      },
    );
  }
}

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.regular,
    required this.small,
    this.mode,
  });

  final LayoutMode? mode;
  final WidgetBuilder small;
  final WidgetBuilder regular;

  @override
  Widget build(BuildContext context) {
    final mode = this.mode ?? LayoutModeProvider.of(context);
    return switch (mode) {
      LayoutMode.small => small(context),
      LayoutMode.regular => regular(context),
    };
  }
}
