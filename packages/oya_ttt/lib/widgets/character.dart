import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

/// Direction that a character should face.
enum AppCharacterDirection {
  right,
  left;

  /// Converts the direction to a [TextDirection].
  TextDirection toTextDirection() => switch (this) {
    left => TextDirection.rtl,
    right => TextDirection.ltr,
  };
}

/// Displays a character's avatar image from assets.
///
/// The avatar can face either left or right and can be sized as needed.
/// The widget automatically mirrors the image based on the direction.
///
/// Example:
/// ```dart
/// AppCharacterAvatar(
///   character: GameCharacter.cross,
///   direction: AppCharacterDirection.left,
///   size: 100,
/// )
/// ```
class AppCharacterAvatar extends StatelessWidget {
  const AppCharacterAvatar({
    super.key,
    required this.character,
    this.direction = AppCharacterDirection.right,
    this.size = 80,
  });

  /// The size of the avatar in logical pixels.
  final double size;

  /// The direction the character should face.
  final AppCharacterDirection direction;

  /// The game character to display.
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
    return Text(switch (character) {
      GameCharacter.cross => '⨯',
      GameCharacter.circle => '○',
      GameCharacter.spade => '♠',
      GameCharacter.heart => '♥',
      GameCharacter.diamond => '♦',
      GameCharacter.clover => '♣',
    }, style: theme.text.header1.copyWith(fontSize: size, color: color));
  }
}

/// Displays a full character illustration from assets.
///
/// The character can be mirrored horizontally and can optionally have a gradient
/// shader applied from the bottom. This is useful for creating fade effects.
///
/// Example:
/// ```dart
/// AppCharacter(
///   character: GameCharacter.circle,
///   direction: AppCharacterDirection.right,
///   gradientFromBottom: [Colors.transparent, Colors.blue],
/// )
/// ```
class AppCharacter extends StatelessWidget {
  const AppCharacter({
    super.key,
    required this.character,
    this.gradientFromBottom,
    this.direction = AppCharacterDirection.left,
  });

  /// The direction the character should face.
  final AppCharacterDirection direction;

  /// The game character to display.
  final GameCharacter character;

  /// Optional gradient colors applied from bottom to top. First color is at bottom.
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
