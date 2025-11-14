import 'package:flutter/material.dart';

/// A custom page transition that uses a moving gradient to mask the old page
/// and reveal the new page underneath.
class GradientPageTransition extends StatelessWidget {
  const GradientPageTransition({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
    this.direction = Axis.horizontal,
  });

  final Axis direction;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  static Widget horizontal(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return GradientPageTransition(
      animation: curvedAnimation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }

  static Widget vertical(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return GradientPageTransition(
      animation: curvedAnimation,
      secondaryAnimation: secondaryAnimation,
      direction: Axis.vertical,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, oldChild) {
        final begin = 1 - animation.value * 4;
        final end = 3 - animation.value * 4;
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: switch (direction) {
                Axis.horizontal => Alignment(begin, 0),
                Axis.vertical => Alignment(0, begin),
              },
              end: switch (direction) {
                Axis.horizontal => Alignment(end, 0),
                Axis.vertical => Alignment(0, end),
              },
              colors: [Colors.white, Colors.transparent],
              stops: [0, 1],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: oldChild,
        );
      },
      child: child,
    );
  }
}

/// Custom page route that uses the gradient transition
class GradientPageRoute<T> extends PageRouteBuilder<T> {
  GradientPageRoute({
    required super.pageBuilder,
    Axis direction = Axis.vertical,
    super.transitionDuration = const Duration(milliseconds: 600),
    super.reverseTransitionDuration = const Duration(milliseconds: 600),
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           // Ease in-out curve for smooth animation
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: Curves.easeInOut,
           );

           return GradientPageTransition(
             animation: curvedAnimation,
             direction: direction,
             secondaryAnimation: secondaryAnimation,
             child: child,
           );
         },
       );
}
