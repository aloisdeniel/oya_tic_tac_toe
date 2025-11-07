import 'package:flutter/widgets.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

enum AppCharacterDirection { right, left }

class AppCharacterAvatar extends StatelessWidget {
  const AppCharacterAvatar({super.key, required this.character});

  final GameCharacter character;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/avatar/${character.name}.png');
  }
}

class AppCharacter extends StatelessWidget {
  const AppCharacter({super.key, required this.character});

  final GameCharacter character;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/character/${character.name}.png');
  }
}
