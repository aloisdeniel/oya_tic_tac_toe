import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';

enum BackgroundIllustration { room, city }

class Background extends StatelessWidget {
  const Background.room({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.room;

  const Background.city({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.city;

  final Widget child;

  final BackgroundIllustration illustration;

  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    var child = this.child;

    if (decoration case final decoration?) {
      child = DecoratedBox(decoration: decoration, child: child);
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.color.main.background,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(switch (illustration) {
            BackgroundIllustration.room => 'assets/background/room.png',
            BackgroundIllustration.city => 'assets/background/city.png',
          }),
        ),
      ),
      child: child,
    );
  }
}
