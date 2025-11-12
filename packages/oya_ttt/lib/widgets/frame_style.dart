import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_decoration.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';
import 'package:oya_ttt/widgets/base/default_padding.dart';

/// Available frame styles for UI components.
enum FrameStyle { regular, primary }

/// Visual variants for a frame style based on interaction state.
enum FrameStyleVariant { normal, disabled, hover }

/// Applies default frame styling (decoration, foreground, padding) to its descendants.
///
/// This widget provides consistent theming for framed UI elements by setting
/// default values that can be consumed by the [Frame] widget. It supports
/// different styles (regular, primary) and variants (normal, disabled, hover).
///
/// Example:
/// ```dart
/// DefaultFrameStyle(
///   style: FrameStyle.primary,
///   variant: FrameStyleVariant.hover,
///   text: theme.text.button,
///   padding: EdgeInsets.all(16),
///   child: Frame(child: Text('Styled Content')),
/// )
/// ```
class DefaultFrameStyle extends StatelessWidget {
  const DefaultFrameStyle({
    super.key,
    required this.child,
    required this.style,
    this.variant = FrameStyleVariant.normal,
    this.text,
    this.padding,
  });

  /// The child widget that will inherit the frame styling.
  final Widget child;

  /// The frame style to apply.
  final FrameStyle style;

  /// The variant of the style based on interaction state.
  final FrameStyleVariant variant;

  /// Optional text style to apply to descendants.
  final TextStyle? text;

  /// Optional padding to apply to the frame.
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    Widget result = DefaultBoxDecoration(
      decoration: switch (style) {
        FrameStyle.regular => switch (variant) {
          FrameStyleVariant.normal => BoxDecoration(
            color: theme.color.main.background,
          ),
          FrameStyleVariant.disabled => BoxDecoration(
            color: theme.color.main.background.withValues(alpha: 0.30),
          ),
          FrameStyleVariant.hover => BoxDecoration(
            color: theme.color.highlight.background,
          ),
        },
        FrameStyle.primary => switch (variant) {
          FrameStyleVariant.normal => BoxDecoration(
            color: theme.color.highlight.background,
          ),
          FrameStyleVariant.disabled => BoxDecoration(
            color: theme.color.highlight.background.withValues(alpha: 0.80),
          ),
          FrameStyleVariant.hover => BoxDecoration(
            color: theme.color.highlight.background.withValues(alpha: 0.90),
          ),
        },
      },
      backdropFilter: switch (style) {
        FrameStyle.regular => null,
        FrameStyle.primary => null,
      },
      child: DefaultForeground(
        foreground: switch (style) {
          FrameStyle.regular => switch (variant) {
            FrameStyleVariant.normal => theme.color.main.foreground,
            FrameStyleVariant.disabled =>
              theme.color.main.foreground.withValues(alpha: 0.30),

            FrameStyleVariant.hover => theme.color.highlight.foreground,
          },
          FrameStyle.primary => switch (variant) {
            FrameStyleVariant.normal => theme.color.highlight.foreground,
            FrameStyleVariant.disabled =>
              theme.color.highlight.foreground.withValues(alpha: 0.80),
            FrameStyleVariant.hover =>
              theme.color.highlight.foreground.withValues(alpha: 0.90),
          },
        },
        textStyle: text ?? theme.text.body,
        child: child,
      ),
    );
    if (padding case final padding?) {
      result = DefaultPadding(padding: padding, child: result);
    }
    return result;
  }
}
