import 'dart:math' as math;
import 'dart:ui' show FragmentProgram, FragmentShader;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import 'base/animated_sampler.dart';

class AnimatedGlitch extends StatefulWidget {
  const AnimatedGlitch({
    super.key,
    required this.child,
    this.minAmount = 0.3,
    this.maxAmount = 1.0,
    this.scanLineJitter = 0,
    this.verticalJump = 0,
    this.horizontalShake = 0,
    this.colorDrift = 0,
  });

  final double minAmount;
  final double maxAmount;
  final double scanLineJitter;
  final double verticalJump;
  final double horizontalShake;
  final double colorDrift;
  final Widget child;

  @override
  State<AnimatedGlitch> createState() => _AnimatedGlitchState();
}

class _AnimatedGlitchState extends State<AnimatedGlitch>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 50),
  );

  @override
  void initState() {
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final time = _controller.value;
        final factor =
            widget.minAmount +
            (widget.maxAmount - widget.minAmount) * (0.5 - time).abs() * 2;
        return Glitch(
          time: time,
          verticalJump: (
            widget.verticalJump * factor,
            _controller.value * widget.verticalJump * 11.3,
          ),
          horizontalShake: widget.horizontalShake * 0.2 * factor,
          scanLineJitter: (
            0.003 + math.pow(widget.scanLineJitter, 3) * 0.05,
            (1.0 - widget.scanLineJitter * 1.2).clamp(0, 1),
          ),
          colorDrift: (widget.colorDrift * 0.04, _controller.value * 500),
          child: widget.child,
        );
      },
    );
  }
}

class Glitch extends StatefulWidget {
  const Glitch({
    super.key,
    required this.child,
    required this.time,
    required this.scanLineJitter,
    required this.verticalJump,
    required this.horizontalShake,
    required this.colorDrift,
  });

  final double time;
  final (double displacement, double threshold) scanLineJitter;
  final (double amount, double time) verticalJump;
  final double horizontalShake;
  final (double amount, double time) colorDrift;

  final Widget child;

  @override
  State<Glitch> createState() => _GlitchState();
}

class _GlitchState extends State<Glitch> {
  FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    loadShader();
  }

  void loadShader() async {
    final program = await FragmentProgram.fromAsset('shaders/glitch.frag');
    final shader = program.fragmentShader();
    updateShader(shader, null);
    setState(() {
      _shader = shader;
    });
  }

  void updateShader(FragmentShader shader, Size? size) {
    if (size case final size?) {
      shader.setFloat(0, size.width);
      shader.setFloat(1, size.height);
    }

    shader.setFloat(2, widget.time);

    shader.setFloat(3, widget.scanLineJitter.$1);
    shader.setFloat(4, widget.scanLineJitter.$2);

    shader.setFloat(5, widget.verticalJump.$1);
    shader.setFloat(6, widget.verticalJump.$2);

    shader.setFloat(7, widget.horizontalShake);

    shader.setFloat(8, widget.colorDrift.$1);
    shader.setFloat(9, widget.colorDrift.$2);
  }

  @override
  void dispose() {
    _shader?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shader = _shader;
    if (shader == null) return widget.child;
    return AnimatedSampler((ui.Image image, Size size, ui.Canvas canvas) {
      updateShader(shader, size);
      shader.setImageSampler(0, image);
      canvas.drawRect(Offset.zero & size, Paint()..shader = shader);
    }, child: widget.child);
  }
}
