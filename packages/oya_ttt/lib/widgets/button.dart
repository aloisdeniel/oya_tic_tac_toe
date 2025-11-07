import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/default_padding.dart';
import 'package:oya_ttt/widgets/base/frame.dart';
import 'package:oya_ttt/widgets/base/pointer_area.dart';
import 'package:oya_ttt/widgets/frame_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.style,
    this.onPressed,
  });

  final FrameStyle style;

  final VoidCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DefaultPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: PointerArea(
        onTap: onPressed,
        builder: (context, state, _) {
          return DefaultFrameStyle(
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
        },
      ),
    );
  }
}
