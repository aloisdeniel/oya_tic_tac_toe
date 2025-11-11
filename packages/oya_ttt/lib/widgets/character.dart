import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

enum AppCharacterDirection {
  right,
  left;

  TextDirection toTextDirection() => switch (this) {
    left => TextDirection.rtl,
    right => TextDirection.ltr,
  };
}

class AppCharacterAvatar extends StatelessWidget {
  const AppCharacterAvatar({
    super.key,
    required this.character,
    this.direction = AppCharacterDirection.right,
    this.size = 80,
  });

  final double size;
  final AppCharacterDirection direction;
  final GameCharacter character;

  @override
  Widget build(BuildContext context) {
    Widget result = Image.asset(
      'assets/avatar/${character.name}.png',
      width: size,
      height: size,
    );
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
    return Text(switch (character) {
      GameCharacter.cross => '⨯',
      GameCharacter.circle => '〇',
      GameCharacter.spade => '♠',
      GameCharacter.heart => '♥',
      GameCharacter.diamond => '♦',
      GameCharacter.clover => '♣',
    }, style: theme.text.header1.copyWith(fontSize: size, color: color));
  }
}

class AppCharacter extends StatelessWidget {
  const AppCharacter({
    super.key,
    required this.character,
    this.gradientFromBottom,
    this.direction = AppCharacterDirection.left,
  });

  final AppCharacterDirection direction;
  final GameCharacter character;
  final List<Color>? gradientFromBottom;

  @override
  Widget build(BuildContext context) {
    Widget result = Image.asset('assets/character/${character.name}.png');
    if (gradientFromBottom case final colors?) {
      result = ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: colors,
          stops: [0, 0.5],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ).createShader(bounds),
        blendMode: BlendMode.srcATop,
        child: result,
      );
    }
    if (direction == AppCharacterDirection.right) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: result,
      );
    }
    return result;
  }
}
