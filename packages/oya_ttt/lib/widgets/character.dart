import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

enum AppCharacterDirection { right, left }

class AppCharacterAvatar extends StatelessWidget {
  const AppCharacterAvatar({
    super.key,
    required this.character,
    this.direction = AppCharacterDirection.right,
  });

  final AppCharacterDirection direction;
  final GameCharacter character;

  @override
  Widget build(BuildContext context) {
    Widget result = Image.asset('assets/avatar/${character.name}.png');
    if (direction == AppCharacterDirection.left) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: result,
      );
    }
    return result;
  }
}

class AppCharacter extends StatelessWidget {
  const AppCharacter({
    super.key,
    required this.character,
    this.gradientFromBottom,
  });

  final GameCharacter character;
  final List<Color>? gradientFromBottom;

  @override
  Widget build(BuildContext context) {
    Widget result = Image.asset('assets/character/${character.name}.png');
    if (gradientFromBottom case final colors?) {
      result = ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: colors,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ).createShader(bounds),
        blendMode: BlendMode.srcATop,
        child: result,
      );
    }
    return result;
  }
}
