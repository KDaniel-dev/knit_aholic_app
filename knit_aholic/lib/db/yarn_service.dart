import 'package:knit_aholic/Models/yarn.dart';
import 'package:knit_aholic/db/knit_aholic_database.dart';
import 'package:sqflite/sqflite.dart';

class YarnService {
  Future<Yarn> create(Yarn yarn) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final id = await db.insert(tableYarn, yarn.toJson());
    return yarn.copy(id: id);
  }

  Future<Yarn> readFromId(int id) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final maps = await db.query(tableYarn,
        columns: YarnFields.values,
        where: '${YarnFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Yarn.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Yarn>> readFromType(String type) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final maps = await db.query(tableYarn,
        columns: YarnFields.values,
        where: '${YarnFields.type} = ?',
        whereArgs: [type]);

    if (maps.isNotEmpty) {
      return maps.map((e) => Yarn.fromJson(e)).toList();
    } else {
      throw Exception('Type $type not found');
    }
  }

  Future<List<Yarn>> readFromProject(int projectId) async {
    final Database db = await KnitAholicDatabase.instance.database;

    final maps = await db.query(tableYarn,
        columns: YarnFields.values,
        where: '${YarnFields.projectId} = ?',
        whereArgs: [projectId]);

    if (maps.isNotEmpty) {
      return maps.map((e) => Yarn.fromJson(e)).toList();
    } else {
      throw Exception('ProjectId $projectId not found');
    }
  }

  Future<int> update(Yarn yarn) async {
    final Database db = await KnitAholicDatabase.instance.database;

    return await db.update(tableYarn, yarn.toJson(),
        where: '${YarnFields.id} = ?', whereArgs: [yarn.id]);
  }

  Future<int> delete(int id) async {
    final Database db = await KnitAholicDatabase.instance.database;

    return await db
        .delete(tableYarn, where: '${YarnFields.id} = ?', whereArgs: [id]);
  }
}
