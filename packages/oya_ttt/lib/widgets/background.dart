import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/transparent_image.dart';
import 'package:oya_ttt/widgets/glitch.dart';

/// Enum representing available background illustrations for the game.
enum BackgroundIllustration { city, city2, room, room2, park1, park2, elevator }

/// A widget that displays a themed background with an illustration and glitch effect.
///
/// The [Background] widget provides various preset backgrounds (city, room, park, elevator)
/// with an animated glitch effect applied to the illustration. The illustration is loaded
/// from assets and displayed with a background color from the app theme.
///
/// Example:
/// ```dart
/// Background.city(
///   child: YourContent(),
///   decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
/// )
/// ```
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

  const Background.elevator({super.key, required this.child, this.decoration})
    : illustration = BackgroundIllustration.elevator;

  const Background({
    super.key,
    required this.child,
    required this.illustration,
    this.decoration,
  });

  /// The child widget to display on top of the background.
  final Widget child;

  /// The background illustration to display.
  final BackgroundIllustration illustration;

  /// Optional decoration to apply on top of the background illustration.
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
              child: FadeInImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
                placeholder: transparentImage,
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
