import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite_example/models/dog.dart';

class DogDatabaseManager {
  //Singleton pattern
  const DogDatabaseManager._();

  static const DogDatabaseManager instace = DogDatabaseManager._();

  static Database? _database;
  static const _dbName = 'dogs.db';
  static const _dbVersion = 1;

  Future<Database> get database async {
    //Check first if we already have openned the DB
    if (_database != null) return _database!;
    //If never opened, open and store reference to it
    _database = await _openDB();
    return _database!;
  }

  Future<Database> _openDB() async {
    //get the local path to the db in our OS
    final dbPath = await getDatabasesPath();
    // Joining dbPath with our db's path
    final ourPath = join(dbPath, _dbName);

    final db = await openDatabase(
      ourPath,
      version: _dbVersion,
      onCreate: (db, version) {
        //Create actual database
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
    );

    return db;
  }

  void closeDb() async {
    final db = await database;
    db.close();
    _database = null;
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;

    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];
  }

  Future<Dog> getDogById(int id) async {
    final db = await database;
    // Pass id in via whereArgs to prevent SQL Injection
    final dogMaps = await db.query('dogs', where: 'id = ?', whereArgs: [id]);
    return Dog.fromMap(dogMaps.first);
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> insertOrUpdateDog(Dog dog) async {
    final dogs = await getDogs();
    if (dogs.any((innerDog) {
      return dog.id == innerDog.id;
    })) {
      updateDog(dog);
      return;
    }
    insertDog(dog);
  }
}
