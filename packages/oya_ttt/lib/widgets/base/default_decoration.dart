import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class DefaultBoxDecoration extends InheritedWidget {
  /// Creates a default decoration provider with the specified [decoration].
  const DefaultBoxDecoration({
    super.key,
    required super.child,
    required this.decoration,
    this.backdropFilter,
  });

  /// The padding value to provide to descendants.
  final BoxDecoration decoration;

  /// The backdrop filter to provide to descendants.
  final ui.ImageFilter? backdropFilter;

  /// Returns the decoration from the closest [DefaultBoxDecoration] ancestor,
  /// or null if no such ancestor exists.
  static BoxDecoration? maybeDecorationOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DefaultBoxDecoration>()
        ?.decoration;
  }

  /// Returns the decoration from the closest [DefaultBoxDecoration] ancestor,
  /// or null if no such ancestor exists.
  static ui.ImageFilter? maybeBackdropFilterOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DefaultBoxDecoration>()
        ?.backdropFilter;
  }

  @override
  bool updateShouldNotify(covariant DefaultBoxDecoration oldWidget) {
    return decoration != oldWidget.decoration ||
        backdropFilter != oldWidget.backdropFilter;
  }
}
