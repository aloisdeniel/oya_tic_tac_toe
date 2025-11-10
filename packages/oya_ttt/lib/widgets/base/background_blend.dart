import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A widget that blends its [child] with whatever has already
/// been painted behind it using the given [BlendMode].
class BackgroundBlend extends SingleChildRenderObjectWidget {
  const BackgroundBlend({super.key, required this.mode, required Widget child})
    : super(child: child);

  final BlendMode mode;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderBackgroundBlend(mode);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderBackgroundBlend renderObject,
  ) {
    renderObject.mode = mode;
  }
}

class _RenderBackgroundBlend extends RenderProxyBox {
  _RenderBackgroundBlend(this._mode);

  BlendMode _mode;
  BlendMode get mode => _mode;
  set mode(BlendMode value) {
    if (value == _mode) return;
    _mode = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Canvas canvas = context.canvas;
    final Paint paint = Paint()..blendMode = _mode;

    // Create a layer so the child is composited with the existing background
    // using the given BlendMode.
    canvas.saveLayer(offset & size, paint);
    context.paintChild(child!, offset);
    canvas.restore();
  }
}
