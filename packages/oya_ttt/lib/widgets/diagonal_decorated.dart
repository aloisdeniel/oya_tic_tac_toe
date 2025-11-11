import 'package:flutter/widgets.dart';

enum DiagonalEdge { top, bottom }

class DiagonalDecorated extends StatelessWidget {
  const DiagonalDecorated({
    super.key,
    required this.color,
    required this.child,
    this.smallerEdge = DiagonalEdge.top,
    this.start = true,
    this.end = true,
  });

  final Widget child;
  final Color color;
  final DiagonalEdge smallerEdge;
  final bool start;
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
