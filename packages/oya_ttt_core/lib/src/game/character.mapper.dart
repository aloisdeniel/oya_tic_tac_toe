// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'character.dart';

class GameCharacterMapper extends EnumMapper<GameCharacter> {
  GameCharacterMapper._();

  static GameCharacterMapper? _instance;
  static GameCharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameCharacterMapper._());
    }
    return _instance!;
  }

  static GameCharacter fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  GameCharacter decode(dynamic value) {
    switch (value) {
      case r'cross':
        return GameCharacter.cross;
      case r'circle':
        return GameCharacter.circle;
      case r'diamond':
        return GameCharacter.diamond;
      case r'spade':
        return GameCharacter.spade;
      case r'clover':
        return GameCharacter.clover;
      case r'heart':
        return GameCharacter.heart;
      case r'robot':
        return GameCharacter.robot;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(GameCharacter self) {
    switch (self) {
      case GameCharacter.cross:
        return r'cross';
      case GameCharacter.circle:
        return r'circle';
      case GameCharacter.diamond:
        return r'diamond';
      case GameCharacter.spade:
        return r'spade';
      case GameCharacter.clover:
        return r'clover';
      case GameCharacter.heart:
        return r'heart';
      case GameCharacter.robot:
        return r'robot';
    }
  }
}

extension GameCharacterMapperExtension on GameCharacter {
  String toValue() {
    GameCharacterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<GameCharacter>(this) as String;
  }
}

