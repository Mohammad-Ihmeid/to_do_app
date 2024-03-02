import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  } // عشان لما ينشأ الداتا يتاكد بالاول انها منشأ من أول ولا بدها أنشاء

  initialDb() async {
    String databasePath = await getDatabasesPath(); // أحضار مسار تخزين البيانات

    String path = join(databasePath, 'mohammad.db'); // databasePath/mohammad.db

    Database mydb = await openDatabase(path,
        onCreate: _onCreate,
        version: 1,
        onUpgrade: _onUpgrade); // أنشاء الداتا بيس

    //Version لما بدك تعدل على الداتا يعني بدك أضيف جدول جديد مثلا بتزيد ال

    return mydb;
  }

  _onCreate(Database db, int version) async {
    // التعليمات في داخل الاقتران راح تشتغل مرة واحدة بس أنشئ الداتا بيس
    await db.execute('''
     CREATE TABLE ToDoList (
      "ID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
      "Title" TEXT NOT NULL,
      "SubTitle" TEXT NOT NULL 
      )
    ''');
    debugPrint(
        "================== Create DATABASE AND TABLE ==================");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}

  readData(String sql) async {
    Database? mydb = await db;

    List<Map> response =
        await mydb!.rawQuery(sql); // هاي الجملة عشان أقراء البيانات داخل الجدول

    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;

    int response =
        await mydb!.rawInsert(sql); // هاي الجملة عشان اعمل أدخال على الجدول

    return response;
  }

  /*  برجع واحد لما العملية صحيحة وصفر لما تكون خطأ */

  updateData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawUpdate(sql);

    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawDelete(sql);

    return response;
  }
}
