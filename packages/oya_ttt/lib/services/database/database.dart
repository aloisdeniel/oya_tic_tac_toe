import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart' as core;

part 'database.g.dart';

// Games table
@DataClassName('GameRecord')
class Games extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Player 1 info
  IntColumn get player1UserId => integer().nullable()();
  IntColumn get player1Character => integer()();

  // Player 2 info
  IntColumn get player2UserId => integer().nullable()();
  IntColumn get player2Character => integer()();

  // Game metadata
  TextColumn get mode => text()(); // 'basic' or 'meta'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Game states table (stores the current/historical states)
@DataClassName('GameStateRecord')
class GameStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId =>
      integer().references(Games, #id, onDelete: KeyAction.cascade)();

  // State data stored as JSON
  TextColumn get stateJson => text()();

  // Metadata
  IntColumn get turnNumber => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>>? get uniqueKeys => [
    {gameId, turnNumber},
  ];
}

// Users table
@DataClassName('UserRecord')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get favoriteCharacter => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Games, GameStates, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Add future migrations here
      },
    );
  }

  // Game operations
  Future<int> createGame({
    required core.GamePlayer player1,
    required core.GamePlayer player2,
    required core.GameMode mode,
  }) async {
    final gameId = await into(games).insert(
      GamesCompanion.insert(
        player1UserId: Value(player1.user?.id),
        player1Character: player1.character.index,
        player2UserId: Value(player2.user?.id),
        player2Character: player2.character.index,
        mode: mode.name,
      ),
    );

    // Create initial game state
    final initialState = mode == core.GameMode.classic
        ? core.BasicGameState.initial() as core.GameState
        : core.MetaGameState.initial() as core.GameState;

    await saveGameState(gameId, initialState);

    return gameId;
  }

  Future<void> saveGameState(int gameId, core.GameState state) async {
    final stateJson = jsonEncode(state.toMap());
    final turnNumber = _getTurnNumber(state);

    await into(gameStates).insert(
      GameStatesCompanion.insert(
        gameId: gameId,
        stateJson: stateJson,
        turnNumber: turnNumber,
      ),
    );

    // Update game's updatedAt timestamp
    await (update(games)..where((g) => g.id.equals(gameId))).write(
      GamesCompanion(updatedAt: Value(DateTime.now())),
    );
  }

  Future<core.Game?> loadGame(int gameId) async {
    final gameData = await (select(
      games,
    )..where((g) => g.id.equals(gameId))).getSingleOrNull();
    if (gameData == null) return null;

    // Get the latest game state
    final latestState =
        await (select(gameStates)
              ..where((s) => s.gameId.equals(gameId))
              ..orderBy([(s) => OrderingTerm.desc(s.turnNumber)])
              ..limit(1))
            .getSingleOrNull();

    if (latestState == null) return null;

    return await _convertToGame(gameData, latestState);
  }

  Future<List<core.Game>> loadAllGames() async {
    // Get all games with their latest states
    final query = select(
      games,
    ).join([leftOuterJoin(gameStates, gameStates.gameId.equalsExp(games.id))]);

    // Group by game and get the latest state for each
    final results = await query.get();
    final gameMap = <int, (GameRecord, GameStateRecord?)>{};

    for (final row in results) {
      final game = row.readTable(games);
      final state = row.readTableOrNull(gameStates);

      if (state != null) {
        final existing = gameMap[game.id];
        if (existing == null ||
            (existing.$2 == null) ||
            (state.turnNumber > existing.$2!.turnNumber)) {
          gameMap[game.id] = (game, state);
        }
      } else {
        gameMap[game.id] ??= (game, null);
      }
    }

    final gamesList = <core.Game>[];
    for (final entry in gameMap.values) {
      if (entry.$2 != null) {
        gamesList.add(await _convertToGame(entry.$1, entry.$2!));
      }
    }

    return gamesList;
  }

  Future<void> deleteGame(int gameId) async {
    await (delete(games)..where((g) => g.id.equals(gameId))).go();
  }

  // User operations
  Future<int> createUser({
    required String name,
    required core.GameCharacter favoriteCharacter,
  }) async {
    return await into(users).insert(
      UsersCompanion.insert(
        name: name,
        favoriteCharacter: favoriteCharacter.index,
      ),
    );
  }

  Future<core.User?> loadUser(int userId) async {
    final userData = await (select(
      users,
    )..where((u) => u.id.equals(userId))).getSingleOrNull();
    if (userData == null) return null;

    return core.User(
      id: userData.id,
      name: userData.name,
      favoriteCharacter: core.GameCharacter.values[userData.favoriteCharacter],
    );
  }

  Future<List<core.User>> loadAllUsers() async {
    final userDataList = await select(users).get();
    return userDataList
        .map(
          (userData) => core.User(
            id: userData.id,
            name: userData.name,
            favoriteCharacter:
                core.GameCharacter.values[userData.favoriteCharacter],
          ),
        )
        .toList();
  }

  Future<void> updateUser({
    required int userId,
    String? name,
    core.GameCharacter? favoriteCharacter,
  }) async {
    await (update(users)..where((u) => u.id.equals(userId))).write(
      UsersCompanion(
        name: name != null ? Value(name) : const Value.absent(),
        favoriteCharacter: favoriteCharacter != null
            ? Value(favoriteCharacter.index)
            : const Value.absent(),
      ),
    );
  }

  Future<void> deleteUser(int userId) async {
    await (delete(users)..where((u) => u.id.equals(userId))).go();
  }

  // Helper methods
  int _getTurnNumber(core.GameState state) {
    if (state is core.BasicGameState) {
      return state.history.length;
    } else if (state is core.MetaGameState) {
      return state.history.length;
    }
    return 0;
  }

  Future<core.Game> _convertToGame(
    GameRecord gameData,
    GameStateRecord stateData,
  ) async {
    // Parse players
    final player1Character =
        core.GameCharacter.values[gameData.player1Character];
    final player2Character =
        core.GameCharacter.values[gameData.player2Character];

    core.User? player1User;
    core.User? player2User;

    // Load user data if player is not AI
    if (gameData.player1UserId != null) {
      player1User = await loadUser(gameData.player1UserId!);
    }

    if (gameData.player2UserId != null) {
      player2User = await loadUser(gameData.player2UserId!);
    }

    final player1 = player1User != null
        ? core.GamePlayer.user(player1User, player1Character)
        : core.GamePlayer.ai(player1Character);

    final player2 = player2User != null
        ? core.GamePlayer.user(player2User, player2Character)
        : core.GamePlayer.ai(player2Character);

    // Parse game state from JSON
    final stateMap = jsonDecode(stateData.stateJson) as Map<String, dynamic>;
    final state = core.GameStateMapper.fromMap(stateMap);

    return core.Game(
      id: gameData.id,
      player1: player1,
      player2: player2,
      state: state,
      startedAt: gameData.createdAt,
    );
  }
}
