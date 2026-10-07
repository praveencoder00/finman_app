import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(
      databasePath,
      'finman.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            amount REAL NOT NULL,
            category TEXT NOT NULL,
            type TEXT NOT NULL,
            payment_mode TEXT NOT NULL,
            date TEXT NOT NULL,
            note TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertExpense(Map<String, dynamic> expense) async {
  final db = await database;

  return await db.insert(
    'expenses',
    expense,
  );
}
}