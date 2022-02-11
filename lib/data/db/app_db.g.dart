// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _charDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Character` (`char` TEXT NOT NULL, `name` TEXT NOT NULL, `imageTutorialPath` TEXT NOT NULL, `isLearned` INTEGER NOT NULL, PRIMARY KEY (`char`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get charDao {
    return _charDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _characterInsertionAdapter = InsertionAdapter(
            database,
            'Character',
            (Character item) => <String, Object?>{
                  'char': item.char,
                  'name': item.name,
                  'imageTutorialPath': item.imageTutorialPath,
                  'isLearned': item.isLearned ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Character> _characterInsertionAdapter;

  @override
  Future<List<Character>> getAllChar() async {
    return _queryAdapter.queryList('SELECT * FROM Character',
        mapper: (Map<String, Object?> row) => Character(
            row['char'] as String,
            row['name'] as String,
            row['imageTutorialPath'] as String,
            (row['isLearned'] as int) != 0));
  }

  @override
  Stream<Character?> getByLearned(bool isLearned) {
    return _queryAdapter.queryStream(
        'SELECT * FROM Character WHERE isLearned = ?1',
        mapper: (Map<String, Object?> row) => Character(
            row['char'] as String,
            row['name'] as String,
            row['imageTutorialPath'] as String,
            (row['isLearned'] as int) != 0),
        arguments: [isLearned ? 1 : 0],
        queryableName: 'Character',
        isView: false);
  }

  @override
  Future<void> updateLearned(String char, bool newState) async {
    await _queryAdapter.queryNoReturn(
        'update Character set isLearned = ?2 where char = ?1',
        arguments: [char, newState ? 1 : 0]);
  }

  @override
  Future<void> insertPerson(Character char) async {
    await _characterInsertionAdapter.insert(char, OnConflictStrategy.abort);
  }
}
