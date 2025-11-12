import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

/// Displays a character's unicode symbol (e.g., ⨯, ○, ♠).
///
/// The symbol is rendered as text with the specified color and size.
/// If no color is provided, the character's accent color from the theme is used.
///
/// Example:
/// ```dart
/// AppCharacterSymbol(
///   character: GameCharacter.heart,
///   size: 48,
///   color: Colors.red,
/// )
/// ```
class AppCharacterSymbol extends StatelessWidget {
  const AppCharacterSymbol({
    super.key,
    required this.character,
    this.size = 32,
    this.color,
  });

  /// The game character whose symbol to display.
  final GameCharacter character;

  /// The color of the symbol. Defaults to the character's accent foreground color.
  final Color? color;

  /// The font size of the symbol in logical pixels.
  final double size;

  @override
  Widget build(BuildContext context) {
    late final theme = AppTheme.of(context);
    final color = this.color ?? theme.color.accents(character).foreground;
    return SizedBox.square(
      dimension: size,
      child: FittedBox(
        child: SizedBox.square(
          dimension: 24,
          child: CustomPaint(painter: _Painter(character, color)),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  const _Painter(this.character, this.color);

  /// The game character whose symbol to display.
  final GameCharacter character;

  /// The color of the symbol. Defaults to the character's accent foreground color.
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = switch (character) {
      GameCharacter.circle =>
        Path()
          ..moveTo(12, 22)
          ..cubicTo(6.47715, 22, 2, 17.5228, 2, 12)
          ..cubicTo(2, 6.47715, 6.47715, 2, 12, 2)
          ..cubicTo(17.5228, 2, 22, 6.47715, 22, 12)
          ..cubicTo(22, 17.5228, 17.5228, 22, 12, 22)
          ..close()
          ..moveTo(12, 20)
          ..cubicTo(16.4183, 20, 20, 16.4183, 20, 12)
          ..cubicTo(20, 7.58172, 16.4183, 4, 12, 4)
          ..cubicTo(7.58172, 4, 4, 7.58172, 4, 12)
          ..cubicTo(4, 16.4183, 7.58172, 20, 12, 20)
          ..close(),
      GameCharacter.cross =>
        Path()
          ..moveTo(11.9997, 10.5865)
          ..lineTo(16.9495, 5.63672)
          ..lineTo(18.3637, 7.05093)
          ..lineTo(13.4139, 12.0007)
          ..lineTo(18.3637, 16.9504)
          ..lineTo(16.9495, 18.3646)
          ..lineTo(11.9997, 13.4149)
          ..lineTo(7.04996, 18.3646)
          ..lineTo(5.63574, 16.9504)
          ..lineTo(10.5855, 12.0007)
          ..lineTo(5.63574, 7.05093)
          ..lineTo(7.04996, 5.63672)
          ..lineTo(11.9997, 10.5865)
          ..close(),
      GameCharacter.diamond =>
        Path()
          ..moveTo(4.03607, 10.7336)
          ..lineTo(11.2259, 1.94599)
          ..cubicTo(11.626, 1.45697, 12.3737, 1.45697, 12.7738, 1.94599)
          ..lineTo(19.9637, 10.7336)
          ..cubicTo(20.5664, 11.4703, 20.5664, 12.5298, 19.9637, 13.2665)
          ..lineTo(12.7738, 22.0541)
          ..cubicTo(12.3737, 22.5431, 11.626, 22.5431, 11.2259, 22.0541)
          ..lineTo(4.03607, 13.2665)
          ..cubicTo(3.43329, 12.5298, 3.43329, 11.4703, 4.03607, 10.7336)
          ..close(),
      GameCharacter.clover =>
        Path()
          ..moveTo(13.7748, 11.0393)
          ..cubicTo(14.933, 9.26656, 16, 7.63328, 16, 6)
          ..cubicTo(16, 3.79086, 14.2091, 2, 12, 2)
          ..cubicTo(9.79086, 2, 8, 3.79086, 8, 6)
          ..cubicTo(8, 7.63328, 9.06704, 9.26656, 10.2252, 11.0393)
          ..lineTo(10.226, 11.0405)
          ..cubicTo(10.3036, 11.1593, 10.3816, 11.2787, 10.4597, 11.3988)
          ..cubicTo(10.1704, 11.179, 9.90318, 10.9699, 9.65213, 10.7734)
          ..cubicTo(8.27615, 9.69663, 7.38594, 9, 6, 9)
          ..cubicTo(3.79086, 9, 2, 10.7909, 2, 13)
          ..cubicTo(2, 15.2091, 3.79086, 17, 6, 17)
          ..cubicTo(7.63328, 17, 9.26656, 15.933, 11.0393, 14.7748)
          ..lineTo(11.0701, 14.7547)
          ..cubicTo(10.9774, 17.0361, 10.1119, 18.4381, 9.15685, 19.9853)
          ..lineTo(9.15684, 19.9853)
          ..lineTo(9.15683, 19.9853)
          ..cubicTo(9.03494, 20.1828, 8.91159, 20.3826, 8.7882, 20.5869)
          ..cubicTo(8.4039, 21.2232, 8.87465, 22, 9.61803, 22)
          ..lineTo(14.382, 22)
          ..cubicTo(15.1253, 22, 15.5961, 21.2232, 15.2118, 20.5869)
          ..cubicTo(15.0884, 20.3826, 14.9651, 20.1828, 14.8432, 19.9853)
          ..lineTo(14.8432, 19.9853)
          ..lineTo(14.8432, 19.9853)
          ..cubicTo(13.8881, 18.4381, 13.0226, 17.0361, 12.9299, 14.7547)
          ..cubicTo(12.9402, 14.7614, 12.9505, 14.7681, 12.9607, 14.7748)
          ..cubicTo(14.7334, 15.933, 16.3667, 17, 18, 17)
          ..cubicTo(20.2091, 17, 22, 15.2091, 22, 13)
          ..cubicTo(22, 10.7909, 20.2091, 9, 18, 9)
          ..cubicTo(16.6141, 9, 15.7238, 9.69663, 14.3479, 10.7734)
          ..cubicTo(14.0968, 10.9699, 13.8296, 11.179, 13.5403, 11.3988)
          ..cubicTo(13.6187, 11.2783, 13.697, 11.1585, 13.7748, 11.0393)
          ..close(),
      GameCharacter.heart =>
        Path()
          ..moveTo(12.001, 4.52853)
          ..cubicTo(14.35, 2.42, 17.98, 2.49, 20.2426, 4.75736)
          ..cubicTo(22.5053, 7.02472, 22.583, 10.637, 20.4786, 12.993)
          ..lineTo(11.9999, 21.485)
          ..lineTo(3.52138, 12.993)
          ..cubicTo(1.41705, 10.637, 1.49571, 7.01901, 3.75736, 4.75736)
          ..cubicTo(6.02157, 2.49315, 9.64519, 2.41687, 12.001, 4.52853)
          ..close(),
      GameCharacter.spade =>
        Path()
          ..moveTo(10.9513, 15.8933)
          ..cubicTo(10.0076, 16.5855, 8.80705, 17, 7.5, 17)
          ..cubicTo(4.46243, 17, 2, 14.7614, 2, 12)
          ..cubicTo(2, 8.45193, 5.52486, 5.91097, 8.64404, 3.66245)
          ..cubicTo(9.92046, 2.74232, 11.1289, 1.87116, 12.0001, 1)
          ..cubicTo(12.8713, 1.87114, 14.0797, 2.74228, 15.3561, 3.66238)
          ..cubicTo(18.4752, 5.91092, 22, 8.4519, 22, 12)
          ..cubicTo(22, 14.7614, 19.5376, 17, 16.5, 17)
          ..cubicTo(15.193, 17, 13.9924, 16.5855, 13.0487, 15.8933)
          ..cubicTo(13.333, 17.5389, 14.0578, 18.713, 14.8432, 19.9853)
          ..cubicTo(14.965, 20.1827, 15.0884, 20.3826, 15.2118, 20.5869)
          ..cubicTo(15.5961, 21.2232, 15.1253, 22, 14.382, 22)
          ..lineTo(9.61803, 22)
          ..cubicTo(8.87465, 22, 8.4039, 21.2232, 8.7882, 20.5869)
          ..cubicTo(8.91159, 20.3826, 9.03495, 20.1827, 9.15685, 19.9853)
          ..cubicTo(9.94224, 18.713, 10.667, 17.5389, 10.9513, 15.8933)
          ..close(),
      GameCharacter.robot =>
        Path()
          ..moveTo(13, 10)
          ..lineTo(20, 10)
          ..lineTo(11, 23)
          ..lineTo(11, 14)
          ..lineTo(4, 14)
          ..lineTo(13, 1)
          ..lineTo(13, 10)
          ..close(),
    };

    final paint = Paint()..color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    return character != oldDelegate.character || color != oldDelegate.color;
  }
}
