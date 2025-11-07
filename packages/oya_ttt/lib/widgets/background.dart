import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/glitch.dart';

enum BackgroundIllustration { city, city2, room, room2, park1, park2 }

class Background extends StatelessWidget {
  const Background.room({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.room;

  const Background.room2({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.room2;

  const Background.city({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.city;

  const Background.city2({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.city2;

  const Background.park1({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.park1;

  const Background.park2({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.park2;

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
    final asset = 'assets/background/${illustration.name}.png';

    return DecoratedBox(
      decoration: BoxDecoration(color: theme.color.main.background),
      child: Stack(
        children: [
          Positioned.fill(
            key: Key('bg'),
            child: AnimatedGlitch(
              scanLineJitter: 0.15,
              horizontalShake: 0.001,
              colorDrift: 0.01,
              child: Image.asset(asset, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
