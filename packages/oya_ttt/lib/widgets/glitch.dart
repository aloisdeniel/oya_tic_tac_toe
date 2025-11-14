import 'dart:math' as math;
import 'dart:ui' show FragmentProgram, FragmentShader;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/state/settings.dart';

import 'base/animated_sampler.dart';

/// A widget that applies an animated glitch effect to its child.
///
/// The glitch effect is created using a fragment shader and includes:
/// - Scan line jitter (horizontal displacement of scan lines)
/// - Vertical jump (vertical displacement)
/// - Horizontal shake (horizontal displacement)
/// - Color drift (RGB channel separation)
///
/// The animation continuously varies the intensity of effects over time.
///
/// Example:
/// ```dart
/// AnimatedGlitch(
///   scanLineJitter: 0.3,
///   horizontalShake: 0.01,
///   colorDrift: 0.1,
///   child: Image.asset('logo.png'),
/// )
/// ```
class AnimatedGlitch extends ConsumerStatefulWidget {
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

  /// Minimum intensity of the effect (0.0 to 1.0).
  final double minAmount;

  /// Maximum intensity of the effect (0.0 to 1.0).
  final double maxAmount;

  /// Intensity of scan line jitter effect (0.0 to 1.0).
  final double scanLineJitter;

  /// Intensity of vertical jump effect (0.0 to 1.0).
  final double verticalJump;

  /// Intensity of horizontal shake effect (0.0 to 1.0).
  final double horizontalShake;

  /// Intensity of color drift/RGB separation effect (0.0 to 1.0).
  final double colorDrift;

  /// The child widget to apply the glitch effect to.
  final Widget child;

  @override
  ConsumerState<AnimatedGlitch> createState() => _AnimatedGlitchState();
}

class _AnimatedGlitchState extends ConsumerState<AnimatedGlitch>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 50),
  );

  final _childKey = GlobalKey();

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
    final disabledAnimations = ref.watch($disableVisualEffectsSetting);
    if (disabledAnimations) {
      return widget.child;
    }

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
          child: KeyedSubtree(key: _childKey, child: widget.child),
        );
      },
    );
  }
}

/// A widget that applies a static glitch effect with specific parameters.
///
/// Unlike [AnimatedGlitch], this widget does not animate on its own.
/// It applies a glitch effect based on the provided time and effect parameters.
/// This is useful when you want to control the glitch animation externally.
class Glitch extends ConsumerStatefulWidget {
  const Glitch({
    super.key,
    required this.child,
    required this.time,
    required this.scanLineJitter,
    required this.verticalJump,
    required this.horizontalShake,
    required this.colorDrift,
  });

  /// The time value to use for the shader (affects animation phase).
  final double time;

  /// Scan line jitter parameters: (displacement amount, threshold).
  final (double displacement, double threshold) scanLineJitter;

  /// Vertical jump parameters: (amount, time).
  final (double amount, double time) verticalJump;

  /// Horizontal shake intensity.
  final double horizontalShake;

  /// Color drift parameters: (amount, time).
  final (double amount, double time) colorDrift;

  /// The child widget to apply the glitch effect to.
  final Widget child;

  @override
  ConsumerState<Glitch> createState() => _GlitchState();
}

class _GlitchState extends ConsumerState<Glitch> {
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
    final disabledAnimations = ref.watch($disableVisualEffectsSetting);
    if (disabledAnimations) {
      return widget.child;
    }
    final shader = _shader;
    if (shader == null) return widget.child;
    return AnimatedSampler((ui.Image image, Size size, ui.Canvas canvas) {
      updateShader(shader, size);
      shader.setImageSampler(0, image);
      canvas.drawRect(Offset.zero & size, Paint()..shader = shader);
    }, child: widget.child);
  }
}
