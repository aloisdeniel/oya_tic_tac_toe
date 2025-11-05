// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game.dart';

class MetaPositionMapper extends ClassMapperBase<MetaPosition> {
  MetaPositionMapper._();

  static MetaPositionMapper? _instance;
  static MetaPositionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetaPositionMapper._());
      PositionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MetaPosition';

  static Position _$boardPos(MetaPosition v) => v.boardPos;
  static const Field<MetaPosition, Position> _f$boardPos = Field(
    'boardPos',
    _$boardPos,
  );
  static Position _$cellPos(MetaPosition v) => v.cellPos;
  static const Field<MetaPosition, Position> _f$cellPos = Field(
    'cellPos',
    _$cellPos,
  );

  @override
  final MappableFields<MetaPosition> fields = const {
    #boardPos: _f$boardPos,
    #cellPos: _f$cellPos,
  };

  static MetaPosition _instantiate(DecodingData data) {
    return MetaPosition(data.dec(_f$boardPos), data.dec(_f$cellPos));
  }

  @override
  final Function instantiate = _instantiate;

  static MetaPosition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MetaPosition>(map);
  }

  static MetaPosition fromJson(String json) {
    return ensureInitialized().decodeJson<MetaPosition>(json);
  }
}

mixin MetaPositionMappable {
  String toJson() {
    return MetaPositionMapper.ensureInitialized().encodeJson<MetaPosition>(
      this as MetaPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return MetaPositionMapper.ensureInitialized().encodeMap<MetaPosition>(
      this as MetaPosition,
    );
  }

  MetaPositionCopyWith<MetaPosition, MetaPosition, MetaPosition> get copyWith =>
      _MetaPositionCopyWithImpl<MetaPosition, MetaPosition>(
        this as MetaPosition,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MetaPositionMapper.ensureInitialized().stringifyValue(
      this as MetaPosition,
    );
  }

  @override
  bool operator ==(Object other) {
    return MetaPositionMapper.ensureInitialized().equalsValue(
      this as MetaPosition,
      other,
    );
  }

  @override
  int get hashCode {
    return MetaPositionMapper.ensureInitialized().hashValue(
      this as MetaPosition,
    );
  }
}

extension MetaPositionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MetaPosition, $Out> {
  MetaPositionCopyWith<$R, MetaPosition, $Out> get $asMetaPosition =>
      $base.as((v, t, t2) => _MetaPositionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MetaPositionCopyWith<$R, $In extends MetaPosition, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PositionCopyWith<$R, Position, Position> get boardPos;
  PositionCopyWith<$R, Position, Position> get cellPos;
  $R call({Position? boardPos, Position? cellPos});
  MetaPositionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetaPositionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MetaPosition, $Out>
    implements MetaPositionCopyWith<$R, MetaPosition, $Out> {
  _MetaPositionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MetaPosition> $mapper =
      MetaPositionMapper.ensureInitialized();
  @override
  PositionCopyWith<$R, Position, Position> get boardPos =>
      $value.boardPos.copyWith.$chain((v) => call(boardPos: v));
  @override
  PositionCopyWith<$R, Position, Position> get cellPos =>
      $value.cellPos.copyWith.$chain((v) => call(cellPos: v));
  @override
  $R call({Position? boardPos, Position? cellPos}) => $apply(
    FieldCopyWithData({
      if (boardPos != null) #boardPos: boardPos,
      if (cellPos != null) #cellPos: cellPos,
    }),
  );
  @override
  MetaPosition $make(CopyWithData data) => MetaPosition(
    data.get(#boardPos, or: $value.boardPos),
    data.get(#cellPos, or: $value.cellPos),
  );

  @override
  MetaPositionCopyWith<$R2, MetaPosition, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MetaPositionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MetaMoveMapper extends ClassMapperBase<MetaMove> {
  MetaMoveMapper._();

  static MetaMoveMapper? _instance;
  static MetaMoveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetaMoveMapper._());
      MetaPositionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MetaMove';

  static int _$turn(MetaMove v) => v.turn;
  static const Field<MetaMove, int> _f$turn = Field('turn', _$turn);
  static GamePlayer _$player(MetaMove v) => v.player;
  static const Field<MetaMove, GamePlayer> _f$player = Field('player', _$player);
  static MetaPosition _$pos(MetaMove v) => v.pos;
  static const Field<MetaMove, MetaPosition> _f$pos = Field('pos', _$pos);

  @override
  final MappableFields<MetaMove> fields = const {
    #turn: _f$turn,
    #player: _f$player,
    #pos: _f$pos,
  };

  static MetaMove _instantiate(DecodingData data) {
    return MetaMove(
      turn: data.dec(_f$turn),
      player: data.dec(_f$player),
      pos: data.dec(_f$pos),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MetaMove fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MetaMove>(map);
  }

  static MetaMove fromJson(String json) {
    return ensureInitialized().decodeJson<MetaMove>(json);
  }
}

mixin MetaMoveMappable {
  String toJson() {
    return MetaMoveMapper.ensureInitialized().encodeJson<MetaMove>(
      this as MetaMove,
    );
  }

  Map<String, dynamic> toMap() {
    return MetaMoveMapper.ensureInitialized().encodeMap<MetaMove>(
      this as MetaMove,
    );
  }

  MetaMoveCopyWith<MetaMove, MetaMove, MetaMove> get copyWith =>
      _MetaMoveCopyWithImpl<MetaMove, MetaMove>(
        this as MetaMove,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MetaMoveMapper.ensureInitialized().stringifyValue(this as MetaMove);
  }

  @override
  bool operator ==(Object other) {
    return MetaMoveMapper.ensureInitialized().equalsValue(
      this as MetaMove,
      other,
    );
  }

  @override
  int get hashCode {
    return MetaMoveMapper.ensureInitialized().hashValue(this as MetaMove);
  }
}

extension MetaMoveValueCopy<$R, $Out> on ObjectCopyWith<$R, MetaMove, $Out> {
  MetaMoveCopyWith<$R, MetaMove, $Out> get $asMetaMove =>
      $base.as((v, t, t2) => _MetaMoveCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MetaMoveCopyWith<$R, $In extends MetaMove, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MetaPositionCopyWith<$R, MetaPosition, MetaPosition> get pos;
  $R call({int? turn, GamePlayer? player, MetaPosition? pos});
  MetaMoveCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetaMoveCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MetaMove, $Out>
    implements MetaMoveCopyWith<$R, MetaMove, $Out> {
  _MetaMoveCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MetaMove> $mapper =
      MetaMoveMapper.ensureInitialized();
  @override
  MetaPositionCopyWith<$R, MetaPosition, MetaPosition> get pos =>
      $value.pos.copyWith.$chain((v) => call(pos: v));
  @override
  $R call({int? turn, GamePlayer? player, MetaPosition? pos}) => $apply(
    FieldCopyWithData({
      if (turn != null) #turn: turn,
      if (player != null) #player: player,
      if (pos != null) #pos: pos,
    }),
  );
  @override
  MetaMove $make(CopyWithData data) => MetaMove(
    turn: data.get(#turn, or: $value.turn),
    player: data.get(#player, or: $value.player),
    pos: data.get(#pos, or: $value.pos),
  );

  @override
  MetaMoveCopyWith<$R2, MetaMove, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MetaMoveCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MetaGameStateMapper extends ClassMapperBase<MetaGameState> {
  MetaGameStateMapper._();

  static MetaGameStateMapper? _instance;
  static MetaGameStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetaGameStateMapper._());
      PositionMapper.ensureInitialized();
      BoardMapper.ensureInitialized();
      MetaMoveMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MetaGameState';

  static Map<Position, Board> _$boards(MetaGameState v) => v.boards;
  static const Field<MetaGameState, Map<Position, Board>> _f$boards = Field(
    'boards',
    _$boards,
  );
  static Board _$metaBoard(MetaGameState v) => v.metaBoard;
  static const Field<MetaGameState, Board> _f$metaBoard = Field(
    'metaBoard',
    _$metaBoard,
  );
  static List<MetaMove> _$history(MetaGameState v) => v.history;
  static const Field<MetaGameState, List<MetaMove>> _f$history = Field(
    'history',
    _$history,
  );
  static GamePlayer _$nextPlayer(MetaGameState v) => v.nextPlayer;
  static const Field<MetaGameState, GamePlayer> _f$nextPlayer = Field(
    'nextPlayer',
    _$nextPlayer,
  );
  static Position? _$activeBoard(MetaGameState v) => v.activeBoard;
  static const Field<MetaGameState, Position> _f$activeBoard = Field(
    'activeBoard',
    _$activeBoard,
  );

  @override
  final MappableFields<MetaGameState> fields = const {
    #boards: _f$boards,
    #metaBoard: _f$metaBoard,
    #history: _f$history,
    #nextPlayer: _f$nextPlayer,
    #activeBoard: _f$activeBoard,
  };

  static MetaGameState _instantiate(DecodingData data) {
    return MetaGameState(
      boards: data.dec(_f$boards),
      metaBoard: data.dec(_f$metaBoard),
      history: data.dec(_f$history),
      nextPlayer: data.dec(_f$nextPlayer),
      activeBoard: data.dec(_f$activeBoard),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MetaGameState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MetaGameState>(map);
  }

  static MetaGameState fromJson(String json) {
    return ensureInitialized().decodeJson<MetaGameState>(json);
  }
}

mixin MetaGameStateMappable {
  String toJson() {
    return MetaGameStateMapper.ensureInitialized().encodeJson<MetaGameState>(
      this as MetaGameState,
    );
  }

  Map<String, dynamic> toMap() {
    return MetaGameStateMapper.ensureInitialized().encodeMap<MetaGameState>(
      this as MetaGameState,
    );
  }

  MetaGameStateCopyWith<MetaGameState, MetaGameState, MetaGameState>
  get copyWith => _MetaGameStateCopyWithImpl<MetaGameState, MetaGameState>(
    this as MetaGameState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return MetaGameStateMapper.ensureInitialized().stringifyValue(
      this as MetaGameState,
    );
  }

  @override
  bool operator ==(Object other) {
    return MetaGameStateMapper.ensureInitialized().equalsValue(
      this as MetaGameState,
      other,
    );
  }

  @override
  int get hashCode {
    return MetaGameStateMapper.ensureInitialized().hashValue(
      this as MetaGameState,
    );
  }
}

extension MetaGameStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MetaGameState, $Out> {
  MetaGameStateCopyWith<$R, MetaGameState, $Out> get $asMetaGameState =>
      $base.as((v, t, t2) => _MetaGameStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MetaGameStateCopyWith<$R, $In extends MetaGameState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, Position, Board, BoardCopyWith<$R, Board, Board>> get boards;
  BoardCopyWith<$R, Board, Board> get metaBoard;
  ListCopyWith<$R, MetaMove, MetaMoveCopyWith<$R, MetaMove, MetaMove>>
  get history;
  PositionCopyWith<$R, Position, Position>? get activeBoard;
  $R call({
    Map<Position, Board>? boards,
    Board? metaBoard,
    List<MetaMove>? history,
    GamePlayer? nextPlayer,
    Position? activeBoard,
  });
  MetaGameStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetaGameStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MetaGameState, $Out>
    implements MetaGameStateCopyWith<$R, MetaGameState, $Out> {
  _MetaGameStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MetaGameState> $mapper =
      MetaGameStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, Position, Board, BoardCopyWith<$R, Board, Board>>
  get boards => MapCopyWith(
    $value.boards,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(boards: v),
  );
  @override
  BoardCopyWith<$R, Board, Board> get metaBoard =>
      $value.metaBoard.copyWith.$chain((v) => call(metaBoard: v));
  @override
  ListCopyWith<$R, MetaMove, MetaMoveCopyWith<$R, MetaMove, MetaMove>>
  get history => ListCopyWith(
    $value.history,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(history: v),
  );
  @override
  PositionCopyWith<$R, Position, Position>? get activeBoard =>
      $value.activeBoard?.copyWith.$chain((v) => call(activeBoard: v));
  @override
  $R call({
    Map<Position, Board>? boards,
    Board? metaBoard,
    List<MetaMove>? history,
    GamePlayer? nextPlayer,
    Object? activeBoard = $none,
  }) => $apply(
    FieldCopyWithData({
      if (boards != null) #boards: boards,
      if (metaBoard != null) #metaBoard: metaBoard,
      if (history != null) #history: history,
      if (nextPlayer != null) #nextPlayer: nextPlayer,
      if (activeBoard != $none) #activeBoard: activeBoard,
    }),
  );
  @override
  MetaGameState $make(CopyWithData data) => MetaGameState(
    boards: data.get(#boards, or: $value.boards),
    metaBoard: data.get(#metaBoard, or: $value.metaBoard),
    history: data.get(#history, or: $value.history),
    nextPlayer: data.get(#nextPlayer, or: $value.nextPlayer),
    activeBoard: data.get(#activeBoard, or: $value.activeBoard),
  );

  @override
  MetaGameStateCopyWith<$R2, MetaGameState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MetaGameStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

