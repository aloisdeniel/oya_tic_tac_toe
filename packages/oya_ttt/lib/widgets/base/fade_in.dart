import 'package:flutter/widgets.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.delay,
  });

  final Widget child;
  final Duration? delay;
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
