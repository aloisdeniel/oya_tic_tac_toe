// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GamesTable extends Games with TableInfo<$GamesTable, GameRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _player1UserIdMeta = const VerificationMeta(
    'player1UserId',
  );
  @override
  late final GeneratedColumn<int> player1UserId = GeneratedColumn<int>(
    'player1_user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _player1CharacterMeta = const VerificationMeta(
    'player1Character',
  );
  @override
  late final GeneratedColumn<int> player1Character = GeneratedColumn<int>(
    'player1_character',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _player2UserIdMeta = const VerificationMeta(
    'player2UserId',
  );
  @override
  late final GeneratedColumn<int> player2UserId = GeneratedColumn<int>(
    'player2_user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _player2CharacterMeta = const VerificationMeta(
    'player2Character',
  );
  @override
  late final GeneratedColumn<int> player2Character = GeneratedColumn<int>(
    'player2_character',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    player1UserId,
    player1Character,
    player2UserId,
    player2Character,
    mode,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player1_user_id')) {
      context.handle(
        _player1UserIdMeta,
        player1UserId.isAcceptableOrUnknown(
          data['player1_user_id']!,
          _player1UserIdMeta,
        ),
      );
    }
    if (data.containsKey('player1_character')) {
      context.handle(
        _player1CharacterMeta,
        player1Character.isAcceptableOrUnknown(
          data['player1_character']!,
          _player1CharacterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_player1CharacterMeta);
    }
    if (data.containsKey('player2_user_id')) {
      context.handle(
        _player2UserIdMeta,
        player2UserId.isAcceptableOrUnknown(
          data['player2_user_id']!,
          _player2UserIdMeta,
        ),
      );
    }
    if (data.containsKey('player2_character')) {
      context.handle(
        _player2CharacterMeta,
        player2Character.isAcceptableOrUnknown(
          data['player2_character']!,
          _player2CharacterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_player2CharacterMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      player1UserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player1_user_id'],
      ),
      player1Character: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player1_character'],
      )!,
      player2UserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player2_user_id'],
      ),
      player2Character: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player2_character'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class GameRecord extends DataClass implements Insertable<GameRecord> {
  final int id;
  final int? player1UserId;
  final int player1Character;
  final int? player2UserId;
  final int player2Character;
  final String mode;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GameRecord({
    required this.id,
    this.player1UserId,
    required this.player1Character,
    this.player2UserId,
    required this.player2Character,
    required this.mode,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || player1UserId != null) {
      map['player1_user_id'] = Variable<int>(player1UserId);
    }
    map['player1_character'] = Variable<int>(player1Character);
    if (!nullToAbsent || player2UserId != null) {
      map['player2_user_id'] = Variable<int>(player2UserId);
    }
    map['player2_character'] = Variable<int>(player2Character);
    map['mode'] = Variable<String>(mode);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      player1UserId: player1UserId == null && nullToAbsent
          ? const Value.absent()
          : Value(player1UserId),
      player1Character: Value(player1Character),
      player2UserId: player2UserId == null && nullToAbsent
          ? const Value.absent()
          : Value(player2UserId),
      player2Character: Value(player2Character),
      mode: Value(mode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GameRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameRecord(
      id: serializer.fromJson<int>(json['id']),
      player1UserId: serializer.fromJson<int?>(json['player1UserId']),
      player1Character: serializer.fromJson<int>(json['player1Character']),
      player2UserId: serializer.fromJson<int?>(json['player2UserId']),
      player2Character: serializer.fromJson<int>(json['player2Character']),
      mode: serializer.fromJson<String>(json['mode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'player1UserId': serializer.toJson<int?>(player1UserId),
      'player1Character': serializer.toJson<int>(player1Character),
      'player2UserId': serializer.toJson<int?>(player2UserId),
      'player2Character': serializer.toJson<int>(player2Character),
      'mode': serializer.toJson<String>(mode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GameRecord copyWith({
    int? id,
    Value<int?> player1UserId = const Value.absent(),
    int? player1Character,
    Value<int?> player2UserId = const Value.absent(),
    int? player2Character,
    String? mode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => GameRecord(
    id: id ?? this.id,
    player1UserId: player1UserId.present
        ? player1UserId.value
        : this.player1UserId,
    player1Character: player1Character ?? this.player1Character,
    player2UserId: player2UserId.present
        ? player2UserId.value
        : this.player2UserId,
    player2Character: player2Character ?? this.player2Character,
    mode: mode ?? this.mode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GameRecord copyWithCompanion(GamesCompanion data) {
    return GameRecord(
      id: data.id.present ? data.id.value : this.id,
      player1UserId: data.player1UserId.present
          ? data.player1UserId.value
          : this.player1UserId,
      player1Character: data.player1Character.present
          ? data.player1Character.value
          : this.player1Character,
      player2UserId: data.player2UserId.present
          ? data.player2UserId.value
          : this.player2UserId,
      player2Character: data.player2Character.present
          ? data.player2Character.value
          : this.player2Character,
      mode: data.mode.present ? data.mode.value : this.mode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameRecord(')
          ..write('id: $id, ')
          ..write('player1UserId: $player1UserId, ')
          ..write('player1Character: $player1Character, ')
          ..write('player2UserId: $player2UserId, ')
          ..write('player2Character: $player2Character, ')
          ..write('mode: $mode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    player1UserId,
    player1Character,
    player2UserId,
    player2Character,
    mode,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameRecord &&
          other.id == this.id &&
          other.player1UserId == this.player1UserId &&
          other.player1Character == this.player1Character &&
          other.player2UserId == this.player2UserId &&
          other.player2Character == this.player2Character &&
          other.mode == this.mode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GamesCompanion extends UpdateCompanion<GameRecord> {
  final Value<int> id;
  final Value<int?> player1UserId;
  final Value<int> player1Character;
  final Value<int?> player2UserId;
  final Value<int> player2Character;
  final Value<String> mode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.player1UserId = const Value.absent(),
    this.player1Character = const Value.absent(),
    this.player2UserId = const Value.absent(),
    this.player2Character = const Value.absent(),
    this.mode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    this.player1UserId = const Value.absent(),
    required int player1Character,
    this.player2UserId = const Value.absent(),
    required int player2Character,
    required String mode,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : player1Character = Value(player1Character),
       player2Character = Value(player2Character),
       mode = Value(mode);
  static Insertable<GameRecord> custom({
    Expression<int>? id,
    Expression<int>? player1UserId,
    Expression<int>? player1Character,
    Expression<int>? player2UserId,
    Expression<int>? player2Character,
    Expression<String>? mode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (player1UserId != null) 'player1_user_id': player1UserId,
      if (player1Character != null) 'player1_character': player1Character,
      if (player2UserId != null) 'player2_user_id': player2UserId,
      if (player2Character != null) 'player2_character': player2Character,
      if (mode != null) 'mode': mode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GamesCompanion copyWith({
    Value<int>? id,
    Value<int?>? player1UserId,
    Value<int>? player1Character,
    Value<int?>? player2UserId,
    Value<int>? player2Character,
    Value<String>? mode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return GamesCompanion(
      id: id ?? this.id,
      player1UserId: player1UserId ?? this.player1UserId,
      player1Character: player1Character ?? this.player1Character,
      player2UserId: player2UserId ?? this.player2UserId,
      player2Character: player2Character ?? this.player2Character,
      mode: mode ?? this.mode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (player1UserId.present) {
      map['player1_user_id'] = Variable<int>(player1UserId.value);
    }
    if (player1Character.present) {
      map['player1_character'] = Variable<int>(player1Character.value);
    }
    if (player2UserId.present) {
      map['player2_user_id'] = Variable<int>(player2UserId.value);
    }
    if (player2Character.present) {
      map['player2_character'] = Variable<int>(player2Character.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('player1UserId: $player1UserId, ')
          ..write('player1Character: $player1Character, ')
          ..write('player2UserId: $player2UserId, ')
          ..write('player2Character: $player2Character, ')
          ..write('mode: $mode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GameStatesTable extends GameStates
    with TableInfo<$GameStatesTable, GameStateRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _stateJsonMeta = const VerificationMeta(
    'stateJson',
  );
  @override
  late final GeneratedColumn<String> stateJson = GeneratedColumn<String>(
    'state_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _turnNumberMeta = const VerificationMeta(
    'turnNumber',
  );
  @override
  late final GeneratedColumn<int> turnNumber = GeneratedColumn<int>(
    'turn_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameId,
    stateJson,
    turnNumber,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameStateRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('state_json')) {
      context.handle(
        _stateJsonMeta,
        stateJson.isAcceptableOrUnknown(data['state_json']!, _stateJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_stateJsonMeta);
    }
    if (data.containsKey('turn_number')) {
      context.handle(
        _turnNumberMeta,
        turnNumber.isAcceptableOrUnknown(data['turn_number']!, _turnNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_turnNumberMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {gameId, turnNumber},
  ];
  @override
  GameStateRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameStateRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      stateJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_json'],
      )!,
      turnNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}turn_number'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GameStatesTable createAlias(String alias) {
    return $GameStatesTable(attachedDatabase, alias);
  }
}

class GameStateRecord extends DataClass implements Insertable<GameStateRecord> {
  final int id;
  final int gameId;
  final String stateJson;
  final int turnNumber;
  final DateTime createdAt;
  const GameStateRecord({
    required this.id,
    required this.gameId,
    required this.stateJson,
    required this.turnNumber,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['state_json'] = Variable<String>(stateJson);
    map['turn_number'] = Variable<int>(turnNumber);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GameStatesCompanion toCompanion(bool nullToAbsent) {
    return GameStatesCompanion(
      id: Value(id),
      gameId: Value(gameId),
      stateJson: Value(stateJson),
      turnNumber: Value(turnNumber),
      createdAt: Value(createdAt),
    );
  }

  factory GameStateRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameStateRecord(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      stateJson: serializer.fromJson<String>(json['stateJson']),
      turnNumber: serializer.fromJson<int>(json['turnNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'stateJson': serializer.toJson<String>(stateJson),
      'turnNumber': serializer.toJson<int>(turnNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GameStateRecord copyWith({
    int? id,
    int? gameId,
    String? stateJson,
    int? turnNumber,
    DateTime? createdAt,
  }) => GameStateRecord(
    id: id ?? this.id,
    gameId: gameId ?? this.gameId,
    stateJson: stateJson ?? this.stateJson,
    turnNumber: turnNumber ?? this.turnNumber,
    createdAt: createdAt ?? this.createdAt,
  );
  GameStateRecord copyWithCompanion(GameStatesCompanion data) {
    return GameStateRecord(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      stateJson: data.stateJson.present ? data.stateJson.value : this.stateJson,
      turnNumber: data.turnNumber.present
          ? data.turnNumber.value
          : this.turnNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameStateRecord(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('stateJson: $stateJson, ')
          ..write('turnNumber: $turnNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameId, stateJson, turnNumber, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameStateRecord &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.stateJson == this.stateJson &&
          other.turnNumber == this.turnNumber &&
          other.createdAt == this.createdAt);
}

class GameStatesCompanion extends UpdateCompanion<GameStateRecord> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<String> stateJson;
  final Value<int> turnNumber;
  final Value<DateTime> createdAt;
  const GameStatesCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.stateJson = const Value.absent(),
    this.turnNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GameStatesCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required String stateJson,
    required int turnNumber,
    this.createdAt = const Value.absent(),
  }) : gameId = Value(gameId),
       stateJson = Value(stateJson),
       turnNumber = Value(turnNumber);
  static Insertable<GameStateRecord> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<String>? stateJson,
    Expression<int>? turnNumber,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (stateJson != null) 'state_json': stateJson,
      if (turnNumber != null) 'turn_number': turnNumber,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GameStatesCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<String>? stateJson,
    Value<int>? turnNumber,
    Value<DateTime>? createdAt,
  }) {
    return GameStatesCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      stateJson: stateJson ?? this.stateJson,
      turnNumber: turnNumber ?? this.turnNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (stateJson.present) {
      map['state_json'] = Variable<String>(stateJson.value);
    }
    if (turnNumber.present) {
      map['turn_number'] = Variable<int>(turnNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameStatesCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('stateJson: $stateJson, ')
          ..write('turnNumber: $turnNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _favoriteCharacterMeta = const VerificationMeta(
    'favoriteCharacter',
  );
  @override
  late final GeneratedColumn<int> favoriteCharacter = GeneratedColumn<int>(
    'favorite_character',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    favoriteCharacter,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('favorite_character')) {
      context.handle(
        _favoriteCharacterMeta,
        favoriteCharacter.isAcceptableOrUnknown(
          data['favorite_character']!,
          _favoriteCharacterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_favoriteCharacterMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      favoriteCharacter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}favorite_character'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserRecord extends DataClass implements Insertable<UserRecord> {
  final int id;
  final String name;
  final int favoriteCharacter;
  final DateTime createdAt;
  const UserRecord({
    required this.id,
    required this.name,
    required this.favoriteCharacter,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['favorite_character'] = Variable<int>(favoriteCharacter);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      favoriteCharacter: Value(favoriteCharacter),
      createdAt: Value(createdAt),
    );
  }

  factory UserRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      favoriteCharacter: serializer.fromJson<int>(json['favoriteCharacter']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'favoriteCharacter': serializer.toJson<int>(favoriteCharacter),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserRecord copyWith({
    int? id,
    String? name,
    int? favoriteCharacter,
    DateTime? createdAt,
  }) => UserRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    favoriteCharacter: favoriteCharacter ?? this.favoriteCharacter,
    createdAt: createdAt ?? this.createdAt,
  );
  UserRecord copyWithCompanion(UsersCompanion data) {
    return UserRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      favoriteCharacter: data.favoriteCharacter.present
          ? data.favoriteCharacter.value
          : this.favoriteCharacter,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('favoriteCharacter: $favoriteCharacter, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, favoriteCharacter, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.favoriteCharacter == this.favoriteCharacter &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<UserRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> favoriteCharacter;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.favoriteCharacter = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int favoriteCharacter,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       favoriteCharacter = Value(favoriteCharacter);
  static Insertable<UserRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? favoriteCharacter,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (favoriteCharacter != null) 'favorite_character': favoriteCharacter,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? favoriteCharacter,
    Value<DateTime>? createdAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      favoriteCharacter: favoriteCharacter ?? this.favoriteCharacter,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (favoriteCharacter.present) {
      map['favorite_character'] = Variable<int>(favoriteCharacter.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('favoriteCharacter: $favoriteCharacter, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StatsTable extends Stats with TableInfo<$StatsTable, StatRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userId1Meta = const VerificationMeta(
    'userId1',
  );
  @override
  late final GeneratedColumn<int> userId1 = GeneratedColumn<int>(
    'user_id1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userId2Meta = const VerificationMeta(
    'userId2',
  );
  @override
  late final GeneratedColumn<int> userId2 = GeneratedColumn<int>(
    'user_id2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wonByMeta = const VerificationMeta('wonBy');
  @override
  late final GeneratedColumn<int> wonBy = GeneratedColumn<int>(
    'won_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameId,
    userId1,
    userId2,
    wonBy,
    date,
    duration,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('user_id1')) {
      context.handle(
        _userId1Meta,
        userId1.isAcceptableOrUnknown(data['user_id1']!, _userId1Meta),
      );
    }
    if (data.containsKey('user_id2')) {
      context.handle(
        _userId2Meta,
        userId2.isAcceptableOrUnknown(data['user_id2']!, _userId2Meta),
      );
    }
    if (data.containsKey('won_by')) {
      context.handle(
        _wonByMeta,
        wonBy.isAcceptableOrUnknown(data['won_by']!, _wonByMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      userId1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id1'],
      ),
      userId2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id2'],
      ),
      wonBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}won_by'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
    );
  }

  @override
  $StatsTable createAlias(String alias) {
    return $StatsTable(attachedDatabase, alias);
  }
}

class StatRecord extends DataClass implements Insertable<StatRecord> {
  final int id;
  final int gameId;
  final int? userId1;
  final int? userId2;
  final int? wonBy;
  final DateTime date;
  final int duration;
  const StatRecord({
    required this.id,
    required this.gameId,
    this.userId1,
    this.userId2,
    this.wonBy,
    required this.date,
    required this.duration,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    if (!nullToAbsent || userId1 != null) {
      map['user_id1'] = Variable<int>(userId1);
    }
    if (!nullToAbsent || userId2 != null) {
      map['user_id2'] = Variable<int>(userId2);
    }
    if (!nullToAbsent || wonBy != null) {
      map['won_by'] = Variable<int>(wonBy);
    }
    map['date'] = Variable<DateTime>(date);
    map['duration'] = Variable<int>(duration);
    return map;
  }

  StatsCompanion toCompanion(bool nullToAbsent) {
    return StatsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      userId1: userId1 == null && nullToAbsent
          ? const Value.absent()
          : Value(userId1),
      userId2: userId2 == null && nullToAbsent
          ? const Value.absent()
          : Value(userId2),
      wonBy: wonBy == null && nullToAbsent
          ? const Value.absent()
          : Value(wonBy),
      date: Value(date),
      duration: Value(duration),
    );
  }

  factory StatRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatRecord(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      userId1: serializer.fromJson<int?>(json['userId1']),
      userId2: serializer.fromJson<int?>(json['userId2']),
      wonBy: serializer.fromJson<int?>(json['wonBy']),
      date: serializer.fromJson<DateTime>(json['date']),
      duration: serializer.fromJson<int>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'userId1': serializer.toJson<int?>(userId1),
      'userId2': serializer.toJson<int?>(userId2),
      'wonBy': serializer.toJson<int?>(wonBy),
      'date': serializer.toJson<DateTime>(date),
      'duration': serializer.toJson<int>(duration),
    };
  }

  StatRecord copyWith({
    int? id,
    int? gameId,
    Value<int?> userId1 = const Value.absent(),
    Value<int?> userId2 = const Value.absent(),
    Value<int?> wonBy = const Value.absent(),
    DateTime? date,
    int? duration,
  }) => StatRecord(
    id: id ?? this.id,
    gameId: gameId ?? this.gameId,
    userId1: userId1.present ? userId1.value : this.userId1,
    userId2: userId2.present ? userId2.value : this.userId2,
    wonBy: wonBy.present ? wonBy.value : this.wonBy,
    date: date ?? this.date,
    duration: duration ?? this.duration,
  );
  StatRecord copyWithCompanion(StatsCompanion data) {
    return StatRecord(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      userId1: data.userId1.present ? data.userId1.value : this.userId1,
      userId2: data.userId2.present ? data.userId2.value : this.userId2,
      wonBy: data.wonBy.present ? data.wonBy.value : this.wonBy,
      date: data.date.present ? data.date.value : this.date,
      duration: data.duration.present ? data.duration.value : this.duration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatRecord(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('userId1: $userId1, ')
          ..write('userId2: $userId2, ')
          ..write('wonBy: $wonBy, ')
          ..write('date: $date, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, gameId, userId1, userId2, wonBy, date, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatRecord &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.userId1 == this.userId1 &&
          other.userId2 == this.userId2 &&
          other.wonBy == this.wonBy &&
          other.date == this.date &&
          other.duration == this.duration);
}

class StatsCompanion extends UpdateCompanion<StatRecord> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int?> userId1;
  final Value<int?> userId2;
  final Value<int?> wonBy;
  final Value<DateTime> date;
  final Value<int> duration;
  const StatsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.userId1 = const Value.absent(),
    this.userId2 = const Value.absent(),
    this.wonBy = const Value.absent(),
    this.date = const Value.absent(),
    this.duration = const Value.absent(),
  });
  StatsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    this.userId1 = const Value.absent(),
    this.userId2 = const Value.absent(),
    this.wonBy = const Value.absent(),
    this.date = const Value.absent(),
    required int duration,
  }) : gameId = Value(gameId),
       duration = Value(duration);
  static Insertable<StatRecord> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? userId1,
    Expression<int>? userId2,
    Expression<int>? wonBy,
    Expression<DateTime>? date,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (userId1 != null) 'user_id1': userId1,
      if (userId2 != null) 'user_id2': userId2,
      if (wonBy != null) 'won_by': wonBy,
      if (date != null) 'date': date,
      if (duration != null) 'duration': duration,
    });
  }

  StatsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<int?>? userId1,
    Value<int?>? userId2,
    Value<int?>? wonBy,
    Value<DateTime>? date,
    Value<int>? duration,
  }) {
    return StatsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      userId1: userId1 ?? this.userId1,
      userId2: userId2 ?? this.userId2,
      wonBy: wonBy ?? this.wonBy,
      date: date ?? this.date,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (userId1.present) {
      map['user_id1'] = Variable<int>(userId1.value);
    }
    if (userId2.present) {
      map['user_id2'] = Variable<int>(userId2.value);
    }
    if (wonBy.present) {
      map['won_by'] = Variable<int>(wonBy.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('userId1: $userId1, ')
          ..write('userId2: $userId2, ')
          ..write('wonBy: $wonBy, ')
          ..write('date: $date, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GamesTable games = $GamesTable(this);
  late final $GameStatesTable gameStates = $GameStatesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $StatsTable stats = $StatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    games,
    gameStates,
    users,
    stats,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_states', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stats', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$GamesTableCreateCompanionBuilder =
    GamesCompanion Function({
      Value<int> id,
      Value<int?> player1UserId,
      required int player1Character,
      Value<int?> player2UserId,
      required int player2Character,
      required String mode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$GamesTableUpdateCompanionBuilder =
    GamesCompanion Function({
      Value<int> id,
      Value<int?> player1UserId,
      Value<int> player1Character,
      Value<int?> player2UserId,
      Value<int> player2Character,
      Value<String> mode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$GamesTableReferences
    extends BaseReferences<_$AppDatabase, $GamesTable, GameRecord> {
  $$GamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GameStatesTable, List<GameStateRecord>>
  _gameStatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameStates,
    aliasName: $_aliasNameGenerator(db.games.id, db.gameStates.gameId),
  );

  $$GameStatesTableProcessedTableManager get gameStatesRefs {
    final manager = $$GameStatesTableTableManager(
      $_db,
      $_db.gameStates,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameStatesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StatsTable, List<StatRecord>> _statsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.stats,
    aliasName: $_aliasNameGenerator(db.games.id, db.stats.gameId),
  );

  $$StatsTableProcessedTableManager get statsRefs {
    final manager = $$StatsTableTableManager(
      $_db,
      $_db.stats,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_statsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GamesTableFilterComposer extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get player1UserId => $composableBuilder(
    column: $table.player1UserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get player1Character => $composableBuilder(
    column: $table.player1Character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get player2UserId => $composableBuilder(
    column: $table.player2UserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get player2Character => $composableBuilder(
    column: $table.player2Character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> gameStatesRefs(
    Expression<bool> Function($$GameStatesTableFilterComposer f) f,
  ) {
    final $$GameStatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameStates,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameStatesTableFilterComposer(
            $db: $db,
            $table: $db.gameStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> statsRefs(
    Expression<bool> Function($$StatsTableFilterComposer f) f,
  ) {
    final $$StatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stats,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatsTableFilterComposer(
            $db: $db,
            $table: $db.stats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GamesTableOrderingComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get player1UserId => $composableBuilder(
    column: $table.player1UserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get player1Character => $composableBuilder(
    column: $table.player1Character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get player2UserId => $composableBuilder(
    column: $table.player2UserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get player2Character => $composableBuilder(
    column: $table.player2Character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get player1UserId => $composableBuilder(
    column: $table.player1UserId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get player1Character => $composableBuilder(
    column: $table.player1Character,
    builder: (column) => column,
  );

  GeneratedColumn<int> get player2UserId => $composableBuilder(
    column: $table.player2UserId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get player2Character => $composableBuilder(
    column: $table.player2Character,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> gameStatesRefs<T extends Object>(
    Expression<T> Function($$GameStatesTableAnnotationComposer a) f,
  ) {
    final $$GameStatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameStates,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameStatesTableAnnotationComposer(
            $db: $db,
            $table: $db.gameStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> statsRefs<T extends Object>(
    Expression<T> Function($$StatsTableAnnotationComposer a) f,
  ) {
    final $$StatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stats,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatsTableAnnotationComposer(
            $db: $db,
            $table: $db.stats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GamesTable,
          GameRecord,
          $$GamesTableFilterComposer,
          $$GamesTableOrderingComposer,
          $$GamesTableAnnotationComposer,
          $$GamesTableCreateCompanionBuilder,
          $$GamesTableUpdateCompanionBuilder,
          (GameRecord, $$GamesTableReferences),
          GameRecord,
          PrefetchHooks Function({bool gameStatesRefs, bool statsRefs})
        > {
  $$GamesTableTableManager(_$AppDatabase db, $GamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> player1UserId = const Value.absent(),
                Value<int> player1Character = const Value.absent(),
                Value<int?> player2UserId = const Value.absent(),
                Value<int> player2Character = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GamesCompanion(
                id: id,
                player1UserId: player1UserId,
                player1Character: player1Character,
                player2UserId: player2UserId,
                player2Character: player2Character,
                mode: mode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> player1UserId = const Value.absent(),
                required int player1Character,
                Value<int?> player2UserId = const Value.absent(),
                required int player2Character,
                required String mode,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GamesCompanion.insert(
                id: id,
                player1UserId: player1UserId,
                player1Character: player1Character,
                player2UserId: player2UserId,
                player2Character: player2Character,
                mode: mode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GamesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({gameStatesRefs = false, statsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (gameStatesRefs) db.gameStates,
                if (statsRefs) db.stats,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gameStatesRefs)
                    await $_getPrefetchedData<
                      GameRecord,
                      $GamesTable,
                      GameStateRecord
                    >(
                      currentTable: table,
                      referencedTable: $$GamesTableReferences
                          ._gameStatesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GamesTableReferences(db, table, p0).gameStatesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.gameId == item.id),
                      typedResults: items,
                    ),
                  if (statsRefs)
                    await $_getPrefetchedData<
                      GameRecord,
                      $GamesTable,
                      StatRecord
                    >(
                      currentTable: table,
                      referencedTable: $$GamesTableReferences._statsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$GamesTableReferences(db, table, p0).statsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.gameId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GamesTable,
      GameRecord,
      $$GamesTableFilterComposer,
      $$GamesTableOrderingComposer,
      $$GamesTableAnnotationComposer,
      $$GamesTableCreateCompanionBuilder,
      $$GamesTableUpdateCompanionBuilder,
      (GameRecord, $$GamesTableReferences),
      GameRecord,
      PrefetchHooks Function({bool gameStatesRefs, bool statsRefs})
    >;
typedef $$GameStatesTableCreateCompanionBuilder =
    GameStatesCompanion Function({
      Value<int> id,
      required int gameId,
      required String stateJson,
      required int turnNumber,
      Value<DateTime> createdAt,
    });
typedef $$GameStatesTableUpdateCompanionBuilder =
    GameStatesCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<String> stateJson,
      Value<int> turnNumber,
      Value<DateTime> createdAt,
    });

final class $$GameStatesTableReferences
    extends BaseReferences<_$AppDatabase, $GameStatesTable, GameStateRecord> {
  $$GameStatesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _gameIdTable(_$AppDatabase db) => db.games.createAlias(
    $_aliasNameGenerator(db.gameStates.gameId, db.games.id),
  );

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameStatesTableFilterComposer
    extends Composer<_$AppDatabase, $GameStatesTable> {
  $$GameStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateJson => $composableBuilder(
    column: $table.stateJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get turnNumber => $composableBuilder(
    column: $table.turnNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $GameStatesTable> {
  $$GameStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateJson => $composableBuilder(
    column: $table.stateJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get turnNumber => $composableBuilder(
    column: $table.turnNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableOrderingComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameStatesTable> {
  $$GameStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stateJson =>
      $composableBuilder(column: $table.stateJson, builder: (column) => column);

  GeneratedColumn<int> get turnNumber => $composableBuilder(
    column: $table.turnNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameStatesTable,
          GameStateRecord,
          $$GameStatesTableFilterComposer,
          $$GameStatesTableOrderingComposer,
          $$GameStatesTableAnnotationComposer,
          $$GameStatesTableCreateCompanionBuilder,
          $$GameStatesTableUpdateCompanionBuilder,
          (GameStateRecord, $$GameStatesTableReferences),
          GameStateRecord,
          PrefetchHooks Function({bool gameId})
        > {
  $$GameStatesTableTableManager(_$AppDatabase db, $GameStatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<String> stateJson = const Value.absent(),
                Value<int> turnNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GameStatesCompanion(
                id: id,
                gameId: gameId,
                stateJson: stateJson,
                turnNumber: turnNumber,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                required String stateJson,
                required int turnNumber,
                Value<DateTime> createdAt = const Value.absent(),
              }) => GameStatesCompanion.insert(
                id: id,
                gameId: gameId,
                stateJson: stateJson,
                turnNumber: turnNumber,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameStatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gameId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gameId,
                                referencedTable: $$GameStatesTableReferences
                                    ._gameIdTable(db),
                                referencedColumn: $$GameStatesTableReferences
                                    ._gameIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GameStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameStatesTable,
      GameStateRecord,
      $$GameStatesTableFilterComposer,
      $$GameStatesTableOrderingComposer,
      $$GameStatesTableAnnotationComposer,
      $$GameStatesTableCreateCompanionBuilder,
      $$GameStatesTableUpdateCompanionBuilder,
      (GameStateRecord, $$GameStatesTableReferences),
      GameStateRecord,
      PrefetchHooks Function({bool gameId})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String name,
      required int favoriteCharacter,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> favoriteCharacter,
      Value<DateTime> createdAt,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get favoriteCharacter => $composableBuilder(
    column: $table.favoriteCharacter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get favoriteCharacter => $composableBuilder(
    column: $table.favoriteCharacter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get favoriteCharacter => $composableBuilder(
    column: $table.favoriteCharacter,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserRecord,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserRecord, BaseReferences<_$AppDatabase, $UsersTable, UserRecord>),
          UserRecord,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> favoriteCharacter = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                favoriteCharacter: favoriteCharacter,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int favoriteCharacter,
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                favoriteCharacter: favoriteCharacter,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserRecord,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserRecord, BaseReferences<_$AppDatabase, $UsersTable, UserRecord>),
      UserRecord,
      PrefetchHooks Function()
    >;
typedef $$StatsTableCreateCompanionBuilder =
    StatsCompanion Function({
      Value<int> id,
      required int gameId,
      Value<int?> userId1,
      Value<int?> userId2,
      Value<int?> wonBy,
      Value<DateTime> date,
      required int duration,
    });
typedef $$StatsTableUpdateCompanionBuilder =
    StatsCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<int?> userId1,
      Value<int?> userId2,
      Value<int?> wonBy,
      Value<DateTime> date,
      Value<int> duration,
    });

final class $$StatsTableReferences
    extends BaseReferences<_$AppDatabase, $StatsTable, StatRecord> {
  $$StatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _gameIdTable(_$AppDatabase db) =>
      db.games.createAlias($_aliasNameGenerator(db.stats.gameId, db.games.id));

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StatsTableFilterComposer extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId1 => $composableBuilder(
    column: $table.userId1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId2 => $composableBuilder(
    column: $table.userId2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wonBy => $composableBuilder(
    column: $table.wonBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId1 => $composableBuilder(
    column: $table.userId1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId2 => $composableBuilder(
    column: $table.userId2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wonBy => $composableBuilder(
    column: $table.wonBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableOrderingComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatsTable> {
  $$StatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId1 =>
      $composableBuilder(column: $table.userId1, builder: (column) => column);

  GeneratedColumn<int> get userId2 =>
      $composableBuilder(column: $table.userId2, builder: (column) => column);

  GeneratedColumn<int> get wonBy =>
      $composableBuilder(column: $table.wonBy, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatsTable,
          StatRecord,
          $$StatsTableFilterComposer,
          $$StatsTableOrderingComposer,
          $$StatsTableAnnotationComposer,
          $$StatsTableCreateCompanionBuilder,
          $$StatsTableUpdateCompanionBuilder,
          (StatRecord, $$StatsTableReferences),
          StatRecord,
          PrefetchHooks Function({bool gameId})
        > {
  $$StatsTableTableManager(_$AppDatabase db, $StatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<int?> userId1 = const Value.absent(),
                Value<int?> userId2 = const Value.absent(),
                Value<int?> wonBy = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> duration = const Value.absent(),
              }) => StatsCompanion(
                id: id,
                gameId: gameId,
                userId1: userId1,
                userId2: userId2,
                wonBy: wonBy,
                date: date,
                duration: duration,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                Value<int?> userId1 = const Value.absent(),
                Value<int?> userId2 = const Value.absent(),
                Value<int?> wonBy = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                required int duration,
              }) => StatsCompanion.insert(
                id: id,
                gameId: gameId,
                userId1: userId1,
                userId2: userId2,
                wonBy: wonBy,
                date: date,
                duration: duration,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StatsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({gameId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gameId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gameId,
                                referencedTable: $$StatsTableReferences
                                    ._gameIdTable(db),
                                referencedColumn: $$StatsTableReferences
                                    ._gameIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatsTable,
      StatRecord,
      $$StatsTableFilterComposer,
      $$StatsTableOrderingComposer,
      $$StatsTableAnnotationComposer,
      $$StatsTableCreateCompanionBuilder,
      $$StatsTableUpdateCompanionBuilder,
      (StatRecord, $$StatsTableReferences),
      StatRecord,
      PrefetchHooks Function({bool gameId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GamesTableTableManager get games =>
      $$GamesTableTableManager(_db, _db.games);
  $$GameStatesTableTableManager get gameStates =>
      $$GameStatesTableTableManager(_db, _db.gameStates);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$StatsTableTableManager get stats =>
      $$StatsTableTableManager(_db, _db.stats);
}
