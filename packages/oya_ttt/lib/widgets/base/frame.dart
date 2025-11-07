import 'package:flutter/widgets.dart';
import 'package:oya_ttt/widgets/base/default_decoration.dart';
import 'package:oya_ttt/widgets/base/default_padding.dart';

class Frame extends StatelessWidget {
  const Frame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    final padding = DefaultPadding.maybeOf(context);
    final decoration = DefaultBoxDecoration.maybeDecorationOf(context);
    final backdropFilter = DefaultBoxDecoration.maybeBackdropFilterOf(context);

    if (padding != null || decoration != null) {
      child = AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: padding,
        decoration: decoration,
        child: child,
      );
    }

    if (backdropFilter != null) {
      child = ClipRRect(
        borderRadius: decoration?.borderRadius ?? BorderRadius.zero,
        child: BackdropFilter.grouped(filter: backdropFilter, child: child),
      );
    }

    return child;
  }
}
