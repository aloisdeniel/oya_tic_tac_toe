import 'package:flutter/widgets.dart';

/// Enum representing responsive layout modes.
enum LayoutMode { small, regular }

/// An inherited widget that provides the current layout mode to descendants.
///
/// Used internally by [Breakpoints] to propagate layout mode information
/// down the widget tree.
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

  @override
  bool updateShouldNotify(covariant LayoutModeProvider oldWidget) {
    return layoutMode != oldWidget.layoutMode;
  }
}

/// A widget that determines the layout mode based on screen width.
///
/// Provides a [LayoutModeProvider] that switches between small and regular
/// layout modes based on the specified width breakpoint.
///
/// Example:
/// ```dart
/// Breakpoints(
///   minRegularWidth: 600,
///   child: YourApp(),
/// )
/// ```
class Breakpoints extends StatelessWidget {
  const Breakpoints({
    super.key,
    required this.minRegularWidth,
    required this.child,
  });

  /// The minimum width (in logical pixels) for regular layout mode.
  final double minRegularWidth;

  /// The child widget tree.
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

/// A widget that builds different layouts based on the current layout mode.
///
/// Displays one of two widget trees depending on whether the layout mode
/// is small or regular. The mode can be explicitly provided or inherited
/// from a [LayoutModeProvider] ancestor.
///
/// Example:
/// ```dart
/// Responsive(
///   small: (context) => MobileLayout(),
///   regular: (context) => DesktopLayout(),
/// )
/// ```
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.regular,
    required this.small,
    this.mode,
  });

  /// Explicit layout mode. If null, uses the inherited mode.
  final LayoutMode? mode;

  /// Builder for the small layout.
  final WidgetBuilder small;

  /// Builder for the regular layout.
  final WidgetBuilder regular;

  static LayoutMode of(BuildContext context) {
    return LayoutModeProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final mode = this.mode ?? LayoutModeProvider.of(context);
    return switch (mode) {
      LayoutMode.small => small(context),
      LayoutMode.regular => regular(context),
    };
  }
}
