import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('Database already initialized');
      return;
    } else {
      try {
        String path = join(await getDatabasesPath(), 'task.db');
        debugPrint('Initializing database at path: $path');
        _db = await openDatabase(
          path,
          version: _version,
          onCreate: (Database db, int version) async {
            debugPrint('DB Created!');
            await db.execute(
              'CREATE TABLE $_tableName ('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                  'title STRING, note TEXT, date STRING, '
                  'startTime STRING, endTime STRING, '
                  'remind INTEGER, repeat STRING, '
                  'color INTEGER, '
                  'isCompleted INTEGER)',
            );
          },
          onUpgrade: (db, oldVersion, newVersion) async {
            if (oldVersion < 2) {
              await db.execute('ALTER TABLE $_tableName ADD COLUMN remind INTEGER');
            }
          },
        );
        debugPrint('Database successfully initialized');
      } catch (e) {
        debugPrint('Error initializing database: $e');
      }
    }
  }

  static Future<Database> get database async {
    if (_db == null) {
      await initDb();
    }
    return _db!;
  }

  static Future<int> insert(Task task) async {
    try {
      debugPrint('insert Function called!');
      return await _db!.insert(_tableName, task.toJson());
    } catch (e) {
      debugPrint('Insert operation failed: $e');
      return -1; // Return a failure code
    }
  }

  static Future<int> delete(Task task) async {
    debugPrint('delete Function called!');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    debugPrint('delete All Function called!');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint('query Function called');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    debugPrint('update Function called!');
    return await _db!.rawUpdate('''
      UPDATE $_tableName
      SET isCompleted = ?
      WHERE id = ?
    ''', [1, id]);
  }
}
