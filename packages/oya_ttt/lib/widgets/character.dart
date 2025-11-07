import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
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

class AppCharacterSymbol extends StatelessWidget {
  const AppCharacterSymbol({
    super.key,
    required this.character,
    this.size = 32,
    this.color,
  });

  final GameCharacter character;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    late final theme = AppTheme.of(context);
    final color = this.color ?? theme.color.accents(character).foreground;
    return Icon(
      switch (character) {
        GameCharacter.cross => Icons.close,
        GameCharacter.circle => Icons.circle_outlined,
        GameCharacter.spade => Icons.diamond,
        GameCharacter.heart => Icons.heart_broken,
        GameCharacter.diamond => Icons.diamond,
        GameCharacter.clover => Icons.nature,
      },
      color: color,
      size: size,
    );
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
