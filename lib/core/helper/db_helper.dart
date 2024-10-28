import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quran.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE recent_surahs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            page_number INTEGER,
            verses INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertSurah(String name, int pageNumber, int verses) async {
    final db = await database;
    await db.insert('recent_surahs', {
      'name': name,
      'page_number': pageNumber,
      'verses': verses,
    });
  }

  Future<List<Map<String, dynamic>>> getRecentSurahs() async {
    final db = await database;
    return await db.query('recent_surahs', orderBy: 'id DESC', limit: 10);
  }
}
