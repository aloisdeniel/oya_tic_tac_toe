// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'basic.dart';

class BasicGameStateMapper extends SubClassMapperBase<BasicGameState> {
  BasicGameStateMapper._();

  static BasicGameStateMapper? _instance;
  static BasicGameStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BasicGameStateMapper._());
      GameStateMapper.ensureInitialized().addSubMapper(_instance!);
      BoardMapper.ensureInitialized();
      MoveMapper.ensureInitialized();
      GamePlayerIdMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BasicGameState';

  static Board _$board(BasicGameState v) => v.board;
  static const Field<BasicGameState, Board> _f$board = Field('board', _$board);
  static List<Move> _$history(BasicGameState v) => v.history;
  static const Field<BasicGameState, List<Move>> _f$history = Field(
    'history',
    _$history,
  );
  static GamePlayerId _$nextPlayer(BasicGameState v) => v.nextPlayer;
  static const Field<BasicGameState, GamePlayerId> _f$nextPlayer = Field(
    'nextPlayer',
    _$nextPlayer,
  );

  @override
  final MappableFields<BasicGameState> fields = const {
    #board: _f$board,
    #history: _f$history,
    #nextPlayer: _f$nextPlayer,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'BasicGameState';
  @override
  late final ClassMapperBase superMapper = GameStateMapper.ensureInitialized();

  static BasicGameState _instantiate(DecodingData data) {
    return BasicGameState(
      board: data.dec(_f$board),
      history: data.dec(_f$history),
      nextPlayer: data.dec(_f$nextPlayer),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BasicGameState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BasicGameState>(map);
  }

  static BasicGameState fromJson(String json) {
    return ensureInitialized().decodeJson<BasicGameState>(json);
  }
}

mixin BasicGameStateMappable {
  String toJson() {
    return BasicGameStateMapper.ensureInitialized().encodeJson<BasicGameState>(
      this as BasicGameState,
    );
  }

  Map<String, dynamic> toMap() {
    return BasicGameStateMapper.ensureInitialized().encodeMap<BasicGameState>(
      this as BasicGameState,
    );
  }

  BasicGameStateCopyWith<BasicGameState, BasicGameState, BasicGameState>
  get copyWith => _BasicGameStateCopyWithImpl<BasicGameState, BasicGameState>(
    this as BasicGameState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BasicGameStateMapper.ensureInitialized().stringifyValue(
      this as BasicGameState,
    );
  }

  @override
  bool operator ==(Object other) {
    return BasicGameStateMapper.ensureInitialized().equalsValue(
      this as BasicGameState,
      other,
    );
  }

  @override
  int get hashCode {
    return BasicGameStateMapper.ensureInitialized().hashValue(
      this as BasicGameState,
    );
  }
}

extension BasicGameStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BasicGameState, $Out> {
  BasicGameStateCopyWith<$R, BasicGameState, $Out> get $asBasicGameState =>
      $base.as((v, t, t2) => _BasicGameStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BasicGameStateCopyWith<$R, $In extends BasicGameState, $Out>
    implements GameStateCopyWith<$R, $In, $Out> {
  BoardCopyWith<$R, Board, Board> get board;
  ListCopyWith<$R, Move, MoveCopyWith<$R, Move, Move>> get history;
  @override
  $R call({Board? board, List<Move>? history, GamePlayerId? nextPlayer});
  BasicGameStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BasicGameStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BasicGameState, $Out>
    implements BasicGameStateCopyWith<$R, BasicGameState, $Out> {
  _BasicGameStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BasicGameState> $mapper =
      BasicGameStateMapper.ensureInitialized();
  @override
  BoardCopyWith<$R, Board, Board> get board =>
      $value.board.copyWith.$chain((v) => call(board: v));
  @override
  ListCopyWith<$R, Move, MoveCopyWith<$R, Move, Move>> get history =>
      ListCopyWith(
        $value.history,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(history: v),
      );
  @override
  $R call({Board? board, List<Move>? history, GamePlayerId? nextPlayer}) =>
      $apply(
        FieldCopyWithData({
          if (board != null) #board: board,
          if (history != null) #history: history,
          if (nextPlayer != null) #nextPlayer: nextPlayer,
        }),
      );
  @override
  BasicGameState $make(CopyWithData data) => BasicGameState(
    board: data.get(#board, or: $value.board),
    history: data.get(#history, or: $value.history),
    nextPlayer: data.get(#nextPlayer, or: $value.nextPlayer),
  );

  @override
  BasicGameStateCopyWith<$R2, BasicGameState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BasicGameStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PositionMapper extends ClassMapperBase<Position> {
  PositionMapper._();

  static PositionMapper? _instance;
  static PositionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PositionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Position';

  static int _$row(Position v) => v.row;
  static const Field<Position, int> _f$row = Field('row', _$row);
  static int _$col(Position v) => v.col;
  static const Field<Position, int> _f$col = Field('col', _$col);

  @override
  final MappableFields<Position> fields = const {#row: _f$row, #col: _f$col};

  static Position _instantiate(DecodingData data) {
    return Position(data.dec(_f$row), data.dec(_f$col));
  }

  @override
  final Function instantiate = _instantiate;

  static Position fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Position>(map);
  }

  static Position fromJson(String json) {
    return ensureInitialized().decodeJson<Position>(json);
  }
}

mixin PositionMappable {
  String toJson() {
    return PositionMapper.ensureInitialized().encodeJson<Position>(
      this as Position,
    );
  }

  Map<String, dynamic> toMap() {
    return PositionMapper.ensureInitialized().encodeMap<Position>(
      this as Position,
    );
  }

  PositionCopyWith<Position, Position, Position> get copyWith =>
      _PositionCopyWithImpl<Position, Position>(
        this as Position,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PositionMapper.ensureInitialized().stringifyValue(this as Position);
  }

  @override
  bool operator ==(Object other) {
    return PositionMapper.ensureInitialized().equalsValue(
      this as Position,
      other,
    );
  }

  @override
  int get hashCode {
    return PositionMapper.ensureInitialized().hashValue(this as Position);
  }
}

extension PositionValueCopy<$R, $Out> on ObjectCopyWith<$R, Position, $Out> {
  PositionCopyWith<$R, Position, $Out> get $asPosition =>
      $base.as((v, t, t2) => _PositionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PositionCopyWith<$R, $In extends Position, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? row, int? col});
  PositionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PositionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Position, $Out>
    implements PositionCopyWith<$R, Position, $Out> {
  _PositionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Position> $mapper =
      PositionMapper.ensureInitialized();
  @override
  $R call({int? row, int? col}) => $apply(
    FieldCopyWithData({if (row != null) #row: row, if (col != null) #col: col}),
  );
  @override
  Position $make(CopyWithData data) =>
      Position(data.get(#row, or: $value.row), data.get(#col, or: $value.col));

  @override
  PositionCopyWith<$R2, Position, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PositionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BoardMapper extends ClassMapperBase<Board> {
  BoardMapper._();

  static BoardMapper? _instance;
  static BoardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoardMapper._());
      GamePlayerIdMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Board';

  static List<GamePlayerId?> _$cells(Board v) => v.cells;
  static const Field<Board, List<GamePlayerId?>> _f$cells = Field(
    'cells',
    _$cells,
  );

  @override
  final MappableFields<Board> fields = const {#cells: _f$cells};

  static Board _instantiate(DecodingData data) {
    return Board(data.dec(_f$cells));
  }

  @override
  final Function instantiate = _instantiate;

  static Board fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Board>(map);
  }

  static Board fromJson(String json) {
    return ensureInitialized().decodeJson<Board>(json);
  }
}

mixin BoardMappable {
  String toJson() {
    return BoardMapper.ensureInitialized().encodeJson<Board>(this as Board);
  }

  Map<String, dynamic> toMap() {
    return BoardMapper.ensureInitialized().encodeMap<Board>(this as Board);
  }

  BoardCopyWith<Board, Board, Board> get copyWith =>
      _BoardCopyWithImpl<Board, Board>(this as Board, $identity, $identity);
  @override
  String toString() {
    return BoardMapper.ensureInitialized().stringifyValue(this as Board);
  }

  @override
  bool operator ==(Object other) {
    return BoardMapper.ensureInitialized().equalsValue(this as Board, other);
  }

  @override
  int get hashCode {
    return BoardMapper.ensureInitialized().hashValue(this as Board);
  }
}

extension BoardValueCopy<$R, $Out> on ObjectCopyWith<$R, Board, $Out> {
  BoardCopyWith<$R, Board, $Out> get $asBoard =>
      $base.as((v, t, t2) => _BoardCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BoardCopyWith<$R, $In extends Board, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    GamePlayerId?,
    ObjectCopyWith<$R, GamePlayerId?, GamePlayerId?>?
  >
  get cells;
  $R call({List<GamePlayerId?>? cells});
  BoardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoardCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Board, $Out>
    implements BoardCopyWith<$R, Board, $Out> {
  _BoardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Board> $mapper = BoardMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    GamePlayerId?,
    ObjectCopyWith<$R, GamePlayerId?, GamePlayerId?>?
  >
  get cells => ListCopyWith(
    $value.cells,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(cells: v),
  );
  @override
  $R call({List<GamePlayerId?>? cells}) =>
      $apply(FieldCopyWithData({if (cells != null) #cells: cells}));
  @override
  Board $make(CopyWithData data) => Board(data.get(#cells, or: $value.cells));

  @override
  BoardCopyWith<$R2, Board, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoardCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MoveMapper extends ClassMapperBase<Move> {
  MoveMapper._();

  static MoveMapper? _instance;
  static MoveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MoveMapper._());
      GamePlayerIdMapper.ensureInitialized();
      PositionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Move';

  static int _$turn(Move v) => v.turn;
  static const Field<Move, int> _f$turn = Field('turn', _$turn);
  static GamePlayerId _$player(Move v) => v.player;
  static const Field<Move, GamePlayerId> _f$player = Field('player', _$player);
  static Position _$pos(Move v) => v.pos;
  static const Field<Move, Position> _f$pos = Field('pos', _$pos);

  @override
  final MappableFields<Move> fields = const {
    #turn: _f$turn,
    #player: _f$player,
    #pos: _f$pos,
  };

  static Move _instantiate(DecodingData data) {
    return Move(
      turn: data.dec(_f$turn),
      player: data.dec(_f$player),
      pos: data.dec(_f$pos),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Move fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Move>(map);
  }

  static Move fromJson(String json) {
    return ensureInitialized().decodeJson<Move>(json);
  }
}

mixin MoveMappable {
  String toJson() {
    return MoveMapper.ensureInitialized().encodeJson<Move>(this as Move);
  }

  Map<String, dynamic> toMap() {
    return MoveMapper.ensureInitialized().encodeMap<Move>(this as Move);
  }

  MoveCopyWith<Move, Move, Move> get copyWith =>
      _MoveCopyWithImpl<Move, Move>(this as Move, $identity, $identity);
  @override
  String toString() {
    return MoveMapper.ensureInitialized().stringifyValue(this as Move);
  }

  @override
  bool operator ==(Object other) {
    return MoveMapper.ensureInitialized().equalsValue(this as Move, other);
  }

  @override
  int get hashCode {
    return MoveMapper.ensureInitialized().hashValue(this as Move);
  }
}

extension MoveValueCopy<$R, $Out> on ObjectCopyWith<$R, Move, $Out> {
  MoveCopyWith<$R, Move, $Out> get $asMove =>
      $base.as((v, t, t2) => _MoveCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MoveCopyWith<$R, $In extends Move, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PositionCopyWith<$R, Position, Position> get pos;
  $R call({int? turn, GamePlayerId? player, Position? pos});
  MoveCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MoveCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Move, $Out>
    implements MoveCopyWith<$R, Move, $Out> {
  _MoveCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Move> $mapper = MoveMapper.ensureInitialized();
  @override
  PositionCopyWith<$R, Position, Position> get pos =>
      $value.pos.copyWith.$chain((v) => call(pos: v));
  @override
  $R call({int? turn, GamePlayerId? player, Position? pos}) => $apply(
    FieldCopyWithData({
      if (turn != null) #turn: turn,
      if (player != null) #player: player,
      if (pos != null) #pos: pos,
    }),
  );
  @override
  Move $make(CopyWithData data) => Move(
    turn: data.get(#turn, or: $value.turn),
    player: data.get(#player, or: $value.player),
    pos: data.get(#pos, or: $value.pos),
  );

  @override
  MoveCopyWith<$R2, Move, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MoveCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

