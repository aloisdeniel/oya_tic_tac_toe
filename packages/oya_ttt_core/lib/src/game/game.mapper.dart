// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game.dart';

class GameModeMapper extends EnumMapper<GameMode> {
  GameModeMapper._();

  static GameModeMapper? _instance;
  static GameModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameModeMapper._());
    }
    return _instance!;
  }

  static GameMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  GameMode decode(dynamic value) {
    switch (value) {
      case r'classic':
        return GameMode.classic;
      case r'meta':
        return GameMode.meta;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(GameMode self) {
    switch (self) {
      case GameMode.classic:
        return r'classic';
      case GameMode.meta:
        return r'meta';
    }
  }
}

extension GameModeMapperExtension on GameMode {
  String toValue() {
    GameModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<GameMode>(this) as String;
  }
}

class GameMapper extends ClassMapperBase<Game> {
  GameMapper._();

  static GameMapper? _instance;
  static GameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameMapper._());
      GamePlayerMapper.ensureInitialized();
      GameStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Game';

  static int _$id(Game v) => v.id;
  static const Field<Game, int> _f$id = Field('id', _$id);
  static GamePlayer _$player1(Game v) => v.player1;
  static const Field<Game, GamePlayer> _f$player1 = Field('player1', _$player1);
  static GamePlayer _$player2(Game v) => v.player2;
  static const Field<Game, GamePlayer> _f$player2 = Field('player2', _$player2);
  static GameState _$state(Game v) => v.state;
  static const Field<Game, GameState> _f$state = Field('state', _$state);
  static DateTime _$startedAt(Game v) => v.startedAt;
  static const Field<Game, DateTime> _f$startedAt = Field(
    'startedAt',
    _$startedAt,
  );

  @override
  final MappableFields<Game> fields = const {
    #id: _f$id,
    #player1: _f$player1,
    #player2: _f$player2,
    #state: _f$state,
    #startedAt: _f$startedAt,
  };

  static Game _instantiate(DecodingData data) {
    return Game(
      id: data.dec(_f$id),
      player1: data.dec(_f$player1),
      player2: data.dec(_f$player2),
      state: data.dec(_f$state),
      startedAt: data.dec(_f$startedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Game fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Game>(map);
  }

  static Game fromJson(String json) {
    return ensureInitialized().decodeJson<Game>(json);
  }
}

mixin GameMappable {
  String toJson() {
    return GameMapper.ensureInitialized().encodeJson<Game>(this as Game);
  }

  Map<String, dynamic> toMap() {
    return GameMapper.ensureInitialized().encodeMap<Game>(this as Game);
  }

  GameCopyWith<Game, Game, Game> get copyWith =>
      _GameCopyWithImpl<Game, Game>(this as Game, $identity, $identity);
  @override
  String toString() {
    return GameMapper.ensureInitialized().stringifyValue(this as Game);
  }

  @override
  bool operator ==(Object other) {
    return GameMapper.ensureInitialized().equalsValue(this as Game, other);
  }

  @override
  int get hashCode {
    return GameMapper.ensureInitialized().hashValue(this as Game);
  }
}

extension GameValueCopy<$R, $Out> on ObjectCopyWith<$R, Game, $Out> {
  GameCopyWith<$R, Game, $Out> get $asGame =>
      $base.as((v, t, t2) => _GameCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GameCopyWith<$R, $In extends Game, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  GamePlayerCopyWith<$R, GamePlayer, GamePlayer> get player1;
  GamePlayerCopyWith<$R, GamePlayer, GamePlayer> get player2;
  GameStateCopyWith<$R, GameState, GameState> get state;
  $R call({
    int? id,
    GamePlayer? player1,
    GamePlayer? player2,
    GameState? state,
    DateTime? startedAt,
  });
  GameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Game, $Out>
    implements GameCopyWith<$R, Game, $Out> {
  _GameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Game> $mapper = GameMapper.ensureInitialized();
  @override
  GamePlayerCopyWith<$R, GamePlayer, GamePlayer> get player1 =>
      $value.player1.copyWith.$chain((v) => call(player1: v));
  @override
  GamePlayerCopyWith<$R, GamePlayer, GamePlayer> get player2 =>
      $value.player2.copyWith.$chain((v) => call(player2: v));
  @override
  GameStateCopyWith<$R, GameState, GameState> get state =>
      $value.state.copyWith.$chain((v) => call(state: v));
  @override
  $R call({
    int? id,
    GamePlayer? player1,
    GamePlayer? player2,
    GameState? state,
    DateTime? startedAt,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (player1 != null) #player1: player1,
      if (player2 != null) #player2: player2,
      if (state != null) #state: state,
      if (startedAt != null) #startedAt: startedAt,
    }),
  );
  @override
  Game $make(CopyWithData data) => Game(
    id: data.get(#id, or: $value.id),
    player1: data.get(#player1, or: $value.player1),
    player2: data.get(#player2, or: $value.player2),
    state: data.get(#state, or: $value.state),
    startedAt: data.get(#startedAt, or: $value.startedAt),
  );

  @override
  GameCopyWith<$R2, Game, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GameCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GameStateMapper extends ClassMapperBase<GameState> {
  GameStateMapper._();

  static GameStateMapper? _instance;
  static GameStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameStateMapper._());
      BasicGameStateMapper.ensureInitialized();
      MetaGameStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameState';

  @override
  final MappableFields<GameState> fields = const {};

  static GameState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'GameState',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GameState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameState>(map);
  }

  static GameState fromJson(String json) {
    return ensureInitialized().decodeJson<GameState>(json);
  }
}

mixin GameStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GameStateCopyWith<GameState, GameState, GameState> get copyWith;
}

abstract class GameStateCopyWith<$R, $In extends GameState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GameStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

