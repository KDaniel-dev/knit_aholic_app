import 'package:knit_aholic/Models/yarn.dart';
import 'package:sqflite/sqflite.dart';

class KnitAholicDatabase {
  static final KnitAholicDatabase instance = KnitAholicDatabase._init();

  static Database? _database;

  KnitAholicDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('yarn.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableYarn (
        ${YarnFields.id} 'INTEGER PRIMARY KEY AUTOINCREMENT',
        ${YarnFields.type} 'TEXT UNIQUE NOT NULL',
        ${YarnFields.colorId} 'INTEGER NOT NULL',
        ${YarnFields.status} 'INTEGER NOT NULL',
        ${YarnFields.dateAdded} 'DATE NOT NULL',
        ${YarnFields.dateDeleted} 'DATE NULL',
        ${YarnFields.projectId} 'INTEGER NULL')
      ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
