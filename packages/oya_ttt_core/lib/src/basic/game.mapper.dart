// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game.dart';

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
    }
    return _instance!;
  }

  @override
  final String id = 'Board';

  static List<GamePlayer?> _$cells(Board v) => v.cells;
  static const Field<Board, List<GamePlayer?>> _f$cells = Field('cells', _$cells);

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
  ListCopyWith<$R, GamePlayer?, ObjectCopyWith<$R, GamePlayer?, GamePlayer?>?> get cells;
  $R call({List<GamePlayer?>? cells});
  BoardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoardCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Board, $Out>
    implements BoardCopyWith<$R, Board, $Out> {
  _BoardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Board> $mapper = BoardMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GamePlayer?, ObjectCopyWith<$R, GamePlayer?, GamePlayer?>?> get cells =>
      ListCopyWith(
        $value.cells,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(cells: v),
      );
  @override
  $R call({List<GamePlayer?>? cells}) =>
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
      PositionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Move';

  static int _$turn(Move v) => v.turn;
  static const Field<Move, int> _f$turn = Field('turn', _$turn);
  static GamePlayer _$player(Move v) => v.player;
  static const Field<Move, GamePlayer> _f$player = Field('player', _$player);
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
  $R call({int? turn, GamePlayer? player, Position? pos});
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
  $R call({int? turn, GamePlayer? player, Position? pos}) => $apply(
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

class GameStateMapper extends ClassMapperBase<GameState> {
  GameStateMapper._();

  static GameStateMapper? _instance;
  static GameStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameStateMapper._());
      BoardMapper.ensureInitialized();
      MoveMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameState';

  static Board _$board(GameState v) => v.board;
  static const Field<GameState, Board> _f$board = Field('board', _$board);
  static List<Move> _$history(GameState v) => v.history;
  static const Field<GameState, List<Move>> _f$history = Field(
    'history',
    _$history,
  );
  static GamePlayer _$nextPlayer(GameState v) => v.nextPlayer;
  static const Field<GameState, GamePlayer> _f$nextPlayer = Field(
    'nextPlayer',
    _$nextPlayer,
  );

  @override
  final MappableFields<GameState> fields = const {
    #board: _f$board,
    #history: _f$history,
    #nextPlayer: _f$nextPlayer,
  };

  static GameState _instantiate(DecodingData data) {
    return GameState(
      board: data.dec(_f$board),
      history: data.dec(_f$history),
      nextPlayer: data.dec(_f$nextPlayer),
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
  String toJson() {
    return GameStateMapper.ensureInitialized().encodeJson<GameState>(
      this as GameState,
    );
  }

  Map<String, dynamic> toMap() {
    return GameStateMapper.ensureInitialized().encodeMap<GameState>(
      this as GameState,
    );
  }

  GameStateCopyWith<GameState, GameState, GameState> get copyWith =>
      _GameStateCopyWithImpl<GameState, GameState>(
        this as GameState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GameStateMapper.ensureInitialized().stringifyValue(
      this as GameState,
    );
  }

  @override
  bool operator ==(Object other) {
    return GameStateMapper.ensureInitialized().equalsValue(
      this as GameState,
      other,
    );
  }

  @override
  int get hashCode {
    return GameStateMapper.ensureInitialized().hashValue(this as GameState);
  }
}

extension GameStateValueCopy<$R, $Out> on ObjectCopyWith<$R, GameState, $Out> {
  GameStateCopyWith<$R, GameState, $Out> get $asGameState =>
      $base.as((v, t, t2) => _GameStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GameStateCopyWith<$R, $In extends GameState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BoardCopyWith<$R, Board, Board> get board;
  ListCopyWith<$R, Move, MoveCopyWith<$R, Move, Move>> get history;
  $R call({Board? board, List<Move>? history, GamePlayer? nextPlayer});
  GameStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameState, $Out>
    implements GameStateCopyWith<$R, GameState, $Out> {
  _GameStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameState> $mapper =
      GameStateMapper.ensureInitialized();
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
  $R call({Board? board, List<Move>? history, GamePlayer? nextPlayer}) => $apply(
    FieldCopyWithData({
      if (board != null) #board: board,
      if (history != null) #history: history,
      if (nextPlayer != null) #nextPlayer: nextPlayer,
    }),
  );
  @override
  GameState $make(CopyWithData data) => GameState(
    board: data.get(#board, or: $value.board),
    history: data.get(#history, or: $value.history),
    nextPlayer: data.get(#nextPlayer, or: $value.nextPlayer),
  );

  @override
  GameStateCopyWith<$R2, GameState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GameStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

