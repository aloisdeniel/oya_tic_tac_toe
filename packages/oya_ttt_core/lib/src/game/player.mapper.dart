// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player.dart';

class GamePlayerIdMapper extends EnumMapper<GamePlayerId> {
  GamePlayerIdMapper._();

  static GamePlayerIdMapper? _instance;
  static GamePlayerIdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GamePlayerIdMapper._());
    }
    return _instance!;
  }

  static GamePlayerId fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  GamePlayerId decode(dynamic value) {
    switch (value) {
      case r'player1':
        return GamePlayerId.player1;
      case r'player2':
        return GamePlayerId.player2;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(GamePlayerId self) {
    switch (self) {
      case GamePlayerId.player1:
        return r'player1';
      case GamePlayerId.player2:
        return r'player2';
    }
  }
}

extension GamePlayerIdMapperExtension on GamePlayerId {
  String toValue() {
    GamePlayerIdMapper.ensureInitialized();
    return MapperContainer.globals.toValue<GamePlayerId>(this) as String;
  }
}

class GamePlayerMapper extends ClassMapperBase<GamePlayer> {
  GamePlayerMapper._();

  static GamePlayerMapper? _instance;
  static GamePlayerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GamePlayerMapper._());
      UserMapper.ensureInitialized();
      GameCharacterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GamePlayer';

  static User? _$user(GamePlayer v) => v.user;
  static const Field<GamePlayer, User> _f$user = Field('user', _$user);
  static GameCharacter _$character(GamePlayer v) => v.character;
  static const Field<GamePlayer, GameCharacter> _f$character = Field(
    'character',
    _$character,
  );

  @override
  final MappableFields<GamePlayer> fields = const {
    #user: _f$user,
    #character: _f$character,
  };

  static GamePlayer _instantiate(DecodingData data) {
    return GamePlayer(
      user: data.dec(_f$user),
      character: data.dec(_f$character),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GamePlayer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GamePlayer>(map);
  }

  static GamePlayer fromJson(String json) {
    return ensureInitialized().decodeJson<GamePlayer>(json);
  }
}

mixin GamePlayerMappable {
  String toJson() {
    return GamePlayerMapper.ensureInitialized().encodeJson<GamePlayer>(
      this as GamePlayer,
    );
  }

  Map<String, dynamic> toMap() {
    return GamePlayerMapper.ensureInitialized().encodeMap<GamePlayer>(
      this as GamePlayer,
    );
  }

  GamePlayerCopyWith<GamePlayer, GamePlayer, GamePlayer> get copyWith =>
      _GamePlayerCopyWithImpl<GamePlayer, GamePlayer>(
        this as GamePlayer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GamePlayerMapper.ensureInitialized().stringifyValue(
      this as GamePlayer,
    );
  }

  @override
  bool operator ==(Object other) {
    return GamePlayerMapper.ensureInitialized().equalsValue(
      this as GamePlayer,
      other,
    );
  }

  @override
  int get hashCode {
    return GamePlayerMapper.ensureInitialized().hashValue(this as GamePlayer);
  }
}

extension GamePlayerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GamePlayer, $Out> {
  GamePlayerCopyWith<$R, GamePlayer, $Out> get $asGamePlayer =>
      $base.as((v, t, t2) => _GamePlayerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GamePlayerCopyWith<$R, $In extends GamePlayer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User>? get user;
  $R call({User? user, GameCharacter? character});
  GamePlayerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GamePlayerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GamePlayer, $Out>
    implements GamePlayerCopyWith<$R, GamePlayer, $Out> {
  _GamePlayerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GamePlayer> $mapper =
      GamePlayerMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call({Object? user = $none, GameCharacter? character}) => $apply(
    FieldCopyWithData({
      if (user != $none) #user: user,
      if (character != null) #character: character,
    }),
  );
  @override
  GamePlayer $make(CopyWithData data) => GamePlayer(
    user: data.get(#user, or: $value.user),
    character: data.get(#character, or: $value.character),
  );

  @override
  GamePlayerCopyWith<$R2, GamePlayer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GamePlayerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

