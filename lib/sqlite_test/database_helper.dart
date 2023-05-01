import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'app.db';
  static const _databaseVersion = 1;

  DatabaseHelper._internal();
  static final DatabaseHelper databaseHelper = DatabaseHelper._internal();
  static DatabaseHelper get instance => databaseHelper;

  static Database ? _database;

  Future<Database ? > get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE User("
          "id INTEGER PRIMARY KEY, "
          "userName TEXT, "
          "email TEXT,"
          "password, "
          ")"
    );
  }
}