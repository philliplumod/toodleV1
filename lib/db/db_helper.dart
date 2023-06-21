// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = "${await getDatabasesPath()}tasks.db";
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        print("DB Created");
        return db.execute(
            "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, isCompleted INTEGER, date STRING, startTime STRING, endTime STRING, color INTEGER, remind INTEGER, repeat STRING)");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("inserting task");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("querying task");
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    print("deleting task");
    await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
    //_db!.delete(_tableName, where: "id = ?", whereArgs: [task.id]);
  }

  static update(int id) async {
    print("updating task");
    return _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''', [1, id]);
  }
}
