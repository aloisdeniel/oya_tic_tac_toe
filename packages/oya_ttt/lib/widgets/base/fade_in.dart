import 'package:flutter/widgets.dart';

/// A widget that fades in its child with optional delay.
///
/// The fade-in animation starts either immediately after the first frame
/// or after the specified [delay]. This is useful for staggered entrance
/// animations.
///
/// Example:
/// ```dart
/// FadeIn(
///   duration: Duration(milliseconds: 500),
///   delay: Duration(milliseconds: 200),
///   child: Text('I will fade in'),
/// )
/// ```
class FadeIn extends StatefulWidget {
  const FadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.delay,
  });

  /// The child widget to fade in.
  final Widget child;

  /// Optional delay before starting the fade-in animation.
  final Duration? delay;

  /// The duration of the fade-in animation.
  final Duration duration;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  var visible = false;

  @override
  void initState() {
    super.initState();
    if (widget.delay case final delay?) {
      Future.delayed(delay).then((_) => _show());
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _show();
      });
    }
  }

  void _show() {
    if (mounted) {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      opacity: visible ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}
