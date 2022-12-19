import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        "CREATE TABLE userreg(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT, username VARCHAR,password VARCHAR, createdAt TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP)");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> userRegistration(
      String name, String userName, String password) async {
    final db = await SqlHelper.db();
    final data = {'name': name, 'username': userName, 'password': password};
    final id = await db.insert('userreg', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    log('user Registration Successfull $data');
    return id;
  }

  static Future<dynamic> validateUser(String userName, String password) async {
    final db = await SqlHelper.db();

    final data = await db.rawQuery(
        "SELECT * FROM userreg WHERE username= '$userName' AND password = '$password' ");
    print(data.toString());
    if (data.isNotEmpty) {
      return data;
    }

    return data;
  }
}
