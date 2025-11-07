import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_decoration.dart';
import 'package:oya_ttt/widgets/base/default_foreground.dart';

enum FrameStyle { regular, highlight }

enum FrameStyleVariant { normal, disabled, hover }

class DefaultFrameStyle extends StatelessWidget {
  const DefaultFrameStyle({
    super.key,
    required this.child,
    required this.style,
    this.variant = FrameStyleVariant.normal,
    this.text,
  });

  final Widget child;
  final FrameStyle style;
  final FrameStyleVariant variant;
  final TextStyle? text;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DefaultBoxDecoration(
      decoration: switch (style) {
        FrameStyle.regular => switch (variant) {
          FrameStyleVariant.normal => BoxDecoration(
            color: theme.color.main.background.withValues(alpha: 0.66),
          ),
          FrameStyleVariant.disabled => BoxDecoration(
            color: theme.color.main.background.withValues(alpha: 0.30),
          ),
          FrameStyleVariant.hover => BoxDecoration(
            color: theme.color.highlight.background,
          ),
        },
        FrameStyle.highlight => switch (variant) {
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
        FrameStyle.regular => ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        FrameStyle.highlight => null,
      },
      child: DefaultForeground(
        foreground: switch (style) {
          FrameStyle.regular => switch (variant) {
            FrameStyleVariant.normal => theme.color.main.foreground,
            FrameStyleVariant.disabled =>
              theme.color.main.foreground.withValues(alpha: 0.30),

            FrameStyleVariant.hover => theme.color.highlight.foreground,
          },
          FrameStyle.highlight => switch (variant) {
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
  }
}
