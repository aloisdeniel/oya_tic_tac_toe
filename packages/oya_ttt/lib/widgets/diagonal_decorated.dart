import 'package:flutter/widgets.dart';

/// Specifies which edge should be smaller in a diagonal decoration.
enum DiagonalEdge { top, bottom }

/// A widget that paints a diagonal parallelogram background behind its child.
///
/// This widget creates a slanted background effect by painting a parallelogram
/// shape. The slant can go from top to bottom or vice versa depending on the
/// [smallerEdge] parameter.
///
/// Example:
/// ```dart
/// DiagonalDecorated(
///   color: Colors.blue,
///   smallerEdge: DiagonalEdge.top,
///   start: true,
///   end: true,
///   child: Text('Slanted Background'),
/// )
/// ```
class DiagonalDecorated extends StatelessWidget {
  const DiagonalDecorated({
    super.key,
    required this.color,
    required this.child,
    this.smallerEdge = DiagonalEdge.top,
    this.start = true,
    this.end = true,
  });

  /// The child widget to display with the diagonal background.
  final Widget child;

  /// The background color of the diagonal decoration.
  final Color color;

  /// Which edge (top or bottom) should be smaller, creating the diagonal effect.
  final DiagonalEdge smallerEdge;

  /// Whether the diagonal extends to the start edge (respects text direction).
  final bool start;

  /// Whether the diagonal extends to the end edge (respects text direction).
  final bool end;

  @override
  Widget build(BuildContext context) {
    final ltr =
        (Directionality.maybeOf(context) ?? TextDirection.ltr) ==
        TextDirection.ltr;
    return CustomPaint(
      painter: _Painter(
        color: color,
        smallerEdge: smallerEdge,
        left: ltr ? start : end,
        right: ltr ? end : start,
      ),
      child: child,
    );
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.color,
    required this.smallerEdge,
    required this.left,
    required this.right,
  });

  final Color color;
  final DiagonalEdge smallerEdge;
  final bool right;
  final bool left;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final top = smallerEdge == DiagonalEdge.top;
    final h = size.height;

    final path = Path()
      ..moveTo(top ? 0 : -h, 0)
      ..lineTo(size.width + (top ? 0 : h), 0)
      ..lineTo(size.width + (top ? h : 0), h)
      ..lineTo(top ? -h : 0, h)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.right != right ||
        oldDelegate.left != left;
  }
}
