import 'package:knit_aholic/Models/yarn_type.dart';
import 'package:knit_aholic/db/knit_aholic_database.dart';
import 'package:sqflite/sqflite.dart';

class YarnTypeService {
  static Future<YarnType> create(YarnType yarnType) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final id = await db.insert(tableYarnType, yarnType.toJson());
    return yarnType.copy(id: id);
  }

  static Future<YarnType> readFromId(int id) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final maps = await db.query(tableYarnType,
        columns: YarnTypeFields.values,
        where: '${YarnTypeFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return YarnType.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<List<YarnType>> readAll() async {
    final Database db = await KnitAholicDatabase.instance.database;

    final maps = await db.query(tableYarnType);

    if (maps.isNotEmpty) {
      return maps.map((e) => YarnType.fromJson(e)).toList();
    } else {
      throw Exception('Yarn not found');
    }
  }

  static Future<int> update(YarnType yarnType) async {
    final Database db = await KnitAholicDatabase.instance.database;

    return await db.update(tableYarnType, yarnType.toJson(),
        where: '${YarnTypeFields.id} = ?', whereArgs: [yarnType.id]);
  }

  static Future<int> delete(int id) async {
    final Database db = await KnitAholicDatabase.instance.database;

    return await db.delete(tableYarnType,
        where: '${YarnTypeFields.id} = ?', whereArgs: [id]);
  }
}
