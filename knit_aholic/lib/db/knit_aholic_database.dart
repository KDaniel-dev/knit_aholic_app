import 'dart:io';
import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/Models/yarn_type.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class KnitAholicDatabase {
  static final KnitAholicDatabase instance = KnitAholicDatabase._init();

  static Database? _database;

  KnitAholicDatabase._init();

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    Directory dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, 'knit_aholic.db');

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onUpgrade: _upgradeDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableYarn (
        ${YarnFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${YarnFields.typeId} INTEGER NOT NULL,
        ${YarnFields.colorId} INTEGER NOT NULL,
        ${YarnFields.status} INTEGER NOT NULL,
        ${YarnFields.dateAdded} DATE NOT NULL,
        ${YarnFields.dateDeleted} DATE NULL,
        ${YarnFields.projectId} INTEGER NULL)
      ''');
    await db.execute('''
      CREATE TABLE $tableYarnType (
        ${YarnTypeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${YarnTypeFields.typeName} TEXT UNIQUE NOT NULL)
      ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      DROP TABLE IF EXISTS $tableYarn;
      DROP TABLE IF EXISTS $tableYarnType;

      CREATE TABLE $tableYarnType (
        ${YarnTypeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${YarnTypeFields.typeName} TEXT UNIQUE NOT NULL);
      CREATE TABLE $tableYarn (
        ${YarnFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${YarnFields.typeId} INTEGER NOT NULL,
        ${YarnFields.colorId} INTEGER NOT NULL,
        ${YarnFields.status} INTEGER NOT NULL,
        ${YarnFields.dateAdded} DATE NOT NULL,
        ${YarnFields.dateDeleted} DATE NULL,
        ${YarnFields.projectId} INTEGER NULL);
      
      ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
