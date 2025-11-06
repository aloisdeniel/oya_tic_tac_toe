// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
      GameCharacterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static int _$id(User v) => v.id;
  static const Field<User, int> _f$id = Field('id', _$id);
  static String _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field('name', _$name);
  static GameCharacter _$favoriteCharacter(User v) => v.favoriteCharacter;
  static const Field<User, GameCharacter> _f$favoriteCharacter = Field(
    'favoriteCharacter',
    _$favoriteCharacter,
  );

  @override
  final MappableFields<User> fields = const {
    #id: _f$id,
    #name: _f$name,
    #favoriteCharacter: _f$favoriteCharacter,
  };

  static User _instantiate(DecodingData data) {
    return User(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      favoriteCharacter: data.dec(_f$favoriteCharacter),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl<User, User>(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, GameCharacter? favoriteCharacter});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, GameCharacter? favoriteCharacter}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (favoriteCharacter != null) #favoriteCharacter: favoriteCharacter,
    }),
  );
  @override
  User $make(CopyWithData data) => User(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    favoriteCharacter: data.get(
      #favoriteCharacter,
      or: $value.favoriteCharacter,
    ),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserStatsMapper extends ClassMapperBase<UserStats> {
  UserStatsMapper._();

  static UserStatsMapper? _instance;
  static UserStatsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserStatsMapper._());
      UserGameStatsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserStats';

  static int _$wonGames(UserStats v) => v.wonGames;
  static const Field<UserStats, int> _f$wonGames = Field(
    'wonGames',
    _$wonGames,
  );
  static int _$lostGames(UserStats v) => v.lostGames;
  static const Field<UserStats, int> _f$lostGames = Field(
    'lostGames',
    _$lostGames,
  );
  static List<UserGameStats> _$lastGames(UserStats v) => v.lastGames;
  static const Field<UserStats, List<UserGameStats>> _f$lastGames = Field(
    'lastGames',
    _$lastGames,
  );

  @override
  final MappableFields<UserStats> fields = const {
    #wonGames: _f$wonGames,
    #lostGames: _f$lostGames,
    #lastGames: _f$lastGames,
  };

  static UserStats _instantiate(DecodingData data) {
    return UserStats(
      wonGames: data.dec(_f$wonGames),
      lostGames: data.dec(_f$lostGames),
      lastGames: data.dec(_f$lastGames),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserStats fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserStats>(map);
  }

  static UserStats fromJson(String json) {
    return ensureInitialized().decodeJson<UserStats>(json);
  }
}

mixin UserStatsMappable {
  String toJson() {
    return UserStatsMapper.ensureInitialized().encodeJson<UserStats>(
      this as UserStats,
    );
  }

  Map<String, dynamic> toMap() {
    return UserStatsMapper.ensureInitialized().encodeMap<UserStats>(
      this as UserStats,
    );
  }

  UserStatsCopyWith<UserStats, UserStats, UserStats> get copyWith =>
      _UserStatsCopyWithImpl<UserStats, UserStats>(
        this as UserStats,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserStatsMapper.ensureInitialized().stringifyValue(
      this as UserStats,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserStatsMapper.ensureInitialized().equalsValue(
      this as UserStats,
      other,
    );
  }

  @override
  int get hashCode {
    return UserStatsMapper.ensureInitialized().hashValue(this as UserStats);
  }
}

extension UserStatsValueCopy<$R, $Out> on ObjectCopyWith<$R, UserStats, $Out> {
  UserStatsCopyWith<$R, UserStats, $Out> get $asUserStats =>
      $base.as((v, t, t2) => _UserStatsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserStatsCopyWith<$R, $In extends UserStats, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    UserGameStats,
    UserGameStatsCopyWith<$R, UserGameStats, UserGameStats>
  >
  get lastGames;
  $R call({int? wonGames, int? lostGames, List<UserGameStats>? lastGames});
  UserStatsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserStatsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserStats, $Out>
    implements UserStatsCopyWith<$R, UserStats, $Out> {
  _UserStatsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserStats> $mapper =
      UserStatsMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    UserGameStats,
    UserGameStatsCopyWith<$R, UserGameStats, UserGameStats>
  >
  get lastGames => ListCopyWith(
    $value.lastGames,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(lastGames: v),
  );
  @override
  $R call({int? wonGames, int? lostGames, List<UserGameStats>? lastGames}) =>
      $apply(
        FieldCopyWithData({
          if (wonGames != null) #wonGames: wonGames,
          if (lostGames != null) #lostGames: lostGames,
          if (lastGames != null) #lastGames: lastGames,
        }),
      );
  @override
  UserStats $make(CopyWithData data) => UserStats(
    wonGames: data.get(#wonGames, or: $value.wonGames),
    lostGames: data.get(#lostGames, or: $value.lostGames),
    lastGames: data.get(#lastGames, or: $value.lastGames),
  );

  @override
  UserStatsCopyWith<$R2, UserStats, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserStatsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserGameStatsMapper extends ClassMapperBase<UserGameStats> {
  UserGameStatsMapper._();

  static UserGameStatsMapper? _instance;
  static UserGameStatsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserGameStatsMapper._());
      GameModeMapper.ensureInitialized();
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserGameStats';

  static int _$gameId(UserGameStats v) => v.gameId;
  static const Field<UserGameStats, int> _f$gameId = Field('gameId', _$gameId);
  static DateTime _$endedAt(UserGameStats v) => v.endedAt;
  static const Field<UserGameStats, DateTime> _f$endedAt = Field(
    'endedAt',
    _$endedAt,
  );
  static GameMode _$mode(UserGameStats v) => v.mode;
  static const Field<UserGameStats, GameMode> _f$mode = Field('mode', _$mode);
  static User? _$opponent(UserGameStats v) => v.opponent;
  static const Field<UserGameStats, User> _f$opponent = Field(
    'opponent',
    _$opponent,
  );
  static bool _$won(UserGameStats v) => v.won;
  static const Field<UserGameStats, bool> _f$won = Field('won', _$won);

  @override
  final MappableFields<UserGameStats> fields = const {
    #gameId: _f$gameId,
    #endedAt: _f$endedAt,
    #mode: _f$mode,
    #opponent: _f$opponent,
    #won: _f$won,
  };

  static UserGameStats _instantiate(DecodingData data) {
    return UserGameStats(
      gameId: data.dec(_f$gameId),
      endedAt: data.dec(_f$endedAt),
      mode: data.dec(_f$mode),
      opponent: data.dec(_f$opponent),
      won: data.dec(_f$won),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserGameStats fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserGameStats>(map);
  }

  static UserGameStats fromJson(String json) {
    return ensureInitialized().decodeJson<UserGameStats>(json);
  }
}

mixin UserGameStatsMappable {
  String toJson() {
    return UserGameStatsMapper.ensureInitialized().encodeJson<UserGameStats>(
      this as UserGameStats,
    );
  }

  Map<String, dynamic> toMap() {
    return UserGameStatsMapper.ensureInitialized().encodeMap<UserGameStats>(
      this as UserGameStats,
    );
  }

  UserGameStatsCopyWith<UserGameStats, UserGameStats, UserGameStats>
  get copyWith => _UserGameStatsCopyWithImpl<UserGameStats, UserGameStats>(
    this as UserGameStats,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return UserGameStatsMapper.ensureInitialized().stringifyValue(
      this as UserGameStats,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserGameStatsMapper.ensureInitialized().equalsValue(
      this as UserGameStats,
      other,
    );
  }

  @override
  int get hashCode {
    return UserGameStatsMapper.ensureInitialized().hashValue(
      this as UserGameStats,
    );
  }
}

extension UserGameStatsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserGameStats, $Out> {
  UserGameStatsCopyWith<$R, UserGameStats, $Out> get $asUserGameStats =>
      $base.as((v, t, t2) => _UserGameStatsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserGameStatsCopyWith<$R, $In extends UserGameStats, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User>? get opponent;
  $R call({
    int? gameId,
    DateTime? endedAt,
    GameMode? mode,
    User? opponent,
    bool? won,
  });
  UserGameStatsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserGameStatsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserGameStats, $Out>
    implements UserGameStatsCopyWith<$R, UserGameStats, $Out> {
  _UserGameStatsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserGameStats> $mapper =
      UserGameStatsMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User>? get opponent =>
      $value.opponent?.copyWith.$chain((v) => call(opponent: v));
  @override
  $R call({
    int? gameId,
    DateTime? endedAt,
    GameMode? mode,
    Object? opponent = $none,
    bool? won,
  }) => $apply(
    FieldCopyWithData({
      if (gameId != null) #gameId: gameId,
      if (endedAt != null) #endedAt: endedAt,
      if (mode != null) #mode: mode,
      if (opponent != $none) #opponent: opponent,
      if (won != null) #won: won,
    }),
  );
  @override
  UserGameStats $make(CopyWithData data) => UserGameStats(
    gameId: data.get(#gameId, or: $value.gameId),
    endedAt: data.get(#endedAt, or: $value.endedAt),
    mode: data.get(#mode, or: $value.mode),
    opponent: data.get(#opponent, or: $value.opponent),
    won: data.get(#won, or: $value.won),
  );

  @override
  UserGameStatsCopyWith<$R2, UserGameStats, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserGameStatsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

