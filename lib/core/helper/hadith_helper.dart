// db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'hadiths.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE hadiths (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            hadithText TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAllHadiths() async {
    final db = await database;
    return await db.query('hadiths');
  }
}
