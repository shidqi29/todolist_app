import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "tasks.db";
      _db = await openDatabase(_path, version: _version,
          onCreate: (db, version) async {
        print("creating a new one");
        return await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title STRING,
            note TEXT, 
            date STRING, startTime STRING,
            endTime STRING, remind INTEGER,
            color INTEGER, isCompleted INTEGER
          )
''');
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("insert function is called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function is called");
    return await _db!.query(_tableName);
  }
}
