import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/settings.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_padding.dart';
import 'package:oya_ttt/widgets/base/frame.dart';
import 'package:oya_ttt/widgets/base/pointer_area.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/glitch.dart';

/// A styled button widget with hover and press effects.
///
/// [AppButton] provides a themed button with frame styling and glitch effects
/// when hovered or pressed. The button's appearance changes based on its state
/// (normal, disabled, hover/pressed) using the provided [FrameStyle].
///
/// Example:
/// ```dart
/// AppButton(
///   style: FrameStyle.primary,
///   onPressed: () => print('Pressed!'),
///   child: Text('Click Me'),
/// )
/// ```
class AppButton extends ConsumerWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.style,
    this.onPressed,
  });

  /// The visual style of the button frame.
  final FrameStyle style;

  /// Callback invoked when the button is pressed. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The widget to display inside the button.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final haptic = ref.watch($hapticFeedbackSetting);

    final theme = AppTheme.of(context);
    return DefaultPadding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.medium,
        vertical: theme.spacing.small,
      ),
      child: PointerArea(
        onTap: onPressed != null
            ? () {
                onPressed?.call();
                if (haptic) {
                  HapticFeedback.lightImpact();
                }
              }
            : null,
        builder: (context, state, _) {
          Widget result = DefaultFrameStyle(
            style: style,
            text: theme.text.button,
            variant: switch (state) {
              PointerState(isEnabled: false) => FrameStyleVariant.disabled,
              PointerState(isHovering: true) ||
              PointerState(isPressed: true) => FrameStyleVariant.hover,
              PointerState() => FrameStyleVariant.normal,
            },
            child: Frame(child: child),
          );
          if (state.isPressed || state.isHovering) {
            result = AnimatedGlitch(
              scanLineJitter: 0.2,
              colorDrift: 0.12,
              child: result,
            );
          }
          return result;
        },
      ),
    );
  }
}
