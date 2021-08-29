import 'dart:io';

import 'package:masalah/model/category.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/result.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final masalahCategoryTable = 'masalah_category';
  static final masalahDataTable = 'masalah_data';

  static final categoryName = 'categoryName';
  static final categoryId = 'categoryId';
  static final masalahCount = 'masalahCount';

  static final masalahId = 'masalahId';
  static final masalahTitle = 'masalahTitle';
  static final masalahDescription = 'masalahDescription';
  static final masalahRefrence = 'masalahRefrence';
  static final masalahCategoryId = 'masalahCategoryId';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $masalahCategoryTable (
            $categoryId INTEGER PRIMARY KEY,
            $categoryName TEXT NOT NULL,
            $masalahCount INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $masalahDataTable (
            $masalahId INTEGER PRIMARY KEY,
            $masalahTitle TEXT NOT NULL,
            $masalahDescription TEXT NOT NULL,
            $masalahRefrence TEXT NOT NULL,
            $masalahCategoryId INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertCategory(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(masalahCategoryTable, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertMasalah(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(masalahDataTable, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<Result> queryAllCategoryRows(String query) async {
    print("queryAllCategoryRows");
    Database db = await instance.database;
    final d = await db.query(masalahCategoryTable,
        where: '$categoryName like ?', whereArgs: ['%$query%']);

    List<Category> data = d.map((i) => Category.fromJson(i)).toList();
    return Result<List<Category>>.success(data);
  }

  Future<Result> queryAllMasalahRows(String query) async {
    Database db = await instance.database;

    final d = await db.query(masalahDataTable,
        where: '$masalahTitle like ?', whereArgs: ['%$query%']);

    List<Masalah> data = d.map((i) => Masalah.fromJson(i)).toList();
    return Result<List<Masalah>>.success(data);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryCategoryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $masalahCategoryTable'));
  }

  Future<int?> queryMasalahRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $masalahDataTable'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> updateCategory(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[categoryId];
    return await db.update(masalahCategoryTable, row,
        where: '$categoryId = ?', whereArgs: [id]);
  }

  Future<int> updateMasalah(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[masalahId];
    return await db.update(masalahDataTable, row,
        where: '$masalahId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> deleteCategory(int id) async {
    Database db = await instance.database;
    return await db.delete(masalahCategoryTable,
        where: '$categoryId = ?', whereArgs: [id]);
  }

  Future<int> deleteMasalah(int id) async {
    Database db = await instance.database;
    return await db
        .delete(masalahDataTable, where: '$masalahId = ?', whereArgs: [id]);
  }
}
