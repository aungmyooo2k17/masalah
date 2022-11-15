import 'dart:io';

import 'package:masalah/model/category.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/model/zakat.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final masalahCategoryTable = 'masalah_category';
  static final masalahDataTable = 'masalah_data';
  static final zakatTable = 'zakat_data';

  static final categoryName = 'categoryName';
  static final categoryId = 'categoryId';
  static final masalahCount = 'masalahCount';

  static final masalahId = 'masalahId';
  static final masalahTitle = 'masalahTitle';
  static final masalahDescription = 'masalahDescription';
  static final masalahRefrence = 'masalahRefrence';
  static final masalahCategoryId = 'masalahCategoryId';

  static final zakatId = 'zakatId';
  static final goldAkhoutKyatthar = 'goldAkhoutKyatthar';
  static final goldAkhoutPae = 'goldAkhoutPae';
  static final goldAkhoutYwae = 'goldAkhoutYwae';
  static final goldAhtaeKyatthar = 'goldAhtaeKyatthar';
  static final goldAhtaePae = 'goldAhtaePae';
  static final goldAhtaeYwae = 'goldAhtaeYwae';
  static final goldPyitceeKyatthar = 'goldPyitceeKyatthar';
  static final goldPyitceePae = 'goldPyitceePae';
  static final goldPyitceeYwae = 'goldPyitceeYwae';
  static final whiteSilverAkhoutKyatthar = 'whiteSilverAkhoutKyatthar';
  static final whiteSilverAkhoutPae = 'whiteSilverAkhoutPae';
  static final whiteSilverAkhoutYwae = 'whiteSilverAkhoutYwae';
  static final whiteSilverAhtaeKyatthar = 'whiteSilverAhtaeKyatthar';
  static final whiteSilverAhtaePae = 'whiteSilverAhtaePae';
  static final whiteSilverAhtaeYwae = 'whiteSilverAhtaeYwae';
  static final whiteSilverPyitceeKyatthar = 'whiteSilverPyitceeKyatthar';
  static final whiteSilverPyitceePae = 'whiteSilverPyitceePae';
  static final whiteSilverPyitceeYwae = 'whiteSilverPyitceeYwae';
  static final silverAkhoutKyatthar = 'silverAkhoutKyatthar';
  static final silverAkhoutPae = 'silverAkhoutPae';
  static final silverAkhoutYwae = 'silverAkhoutYwae';
  static final silverAhtaeKyatthar = 'silverAhtaeKyatthar';
  static final silverAhtaePae = 'silverAhtaePae';
  static final silverAhtaeYwae = 'silverAhtaeYwae';
  static final silverPyitceeKyatthar = 'silverPyitceeKyatthar';
  static final silverPyitceePae = 'silverPyitceePae';
  static final silverPyitceeYwae = 'silverPyitceeYwae';
  static final inHandSuHtarTaw = 'inHandSuHtarTaw';
  static final inHandPyitceeSold = 'inHandPyitceeSold';
  static final inHandPyitceeBorrow = 'inHandPyitceeBorrow';
  static final inHandForeignCurrency = 'inHandForeignCurrency';
  static final inHandContract = 'inHandContract';
  static final inHandOther = 'inHandOther';
  static final inBankInBank = 'inBankInBank';
  static final inBankThuMyarHlwae = 'inBankThuMyarHlwae';
  static final inBankSalary = 'inBankSalary';
  static final inBankOther = 'inBankOther';
  static final thuMyarDebtPyitceeSold = 'thuMyarDebtPyitceeSold';
  static final thuMyarDebtChayPay = 'thuMyarDebtChayPay';
  static final thuMyarDebtAttHtrTaw = 'thuMyarDebtAttHtrTaw';
  static final thuMyarDebtOther = 'thuMyarDebtOther';
  static final realEstateSellHouse = 'realEstateSellHouse';
  static final realEstateSellEscort = 'realEstateSellEscort';
  static final realEstateSellCar = 'realEstateSellCar';
  static final realEstateOther = 'realEstateOther';
  static final rawWearhouse = 'rawWearhouse';
  static final rawHome = 'rawHome';
  static final rawShop = 'rawShop';
  static final rawOther = 'rawOther';
  static final finishWearhouse = 'finishWearhouse';
  static final finishHome = 'finishHome';
  static final finishShop = 'finishShop';
  static final finishAnimal = 'finishAnimal';
  static final finishOther = 'finishOther';
  static final sate = 'sate';
  static final thoe = 'thoe';
  static final kalaout = 'kalaout';
  static final kywae = 'kywae';
  static final nwar = 'nwar';
  static final minusDebtMahur = 'minusDebtMahur';
  static final minusDebt = 'minusDebt';
  static final minusSukyae = 'minusSukyae';
  static final minusMeterBill = 'minusMeterBill';
  static final minusPaybill = 'minusPaybill';
  static final minusPaySalary = 'minusPaySalary';
  static final minusPayRent = 'minusPayRent';
  static final minusBuyGoodPay = 'minusBuyGoodPay';
  static final minusPreZakat = 'minusPreZakat';
  static final createdAt = 'createdAt';
  static final updatedAt = 'updatedAt';
  static final goldRate = 'goldRate';
  static final silverRate = 'silverRate';
  static final yourWorth = 'yourWorth';
  static final yourZakat = 'yourZakat';
  static final yourZakatAnimal = 'yourZakatAnimal';

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

    await db.execute('''
          CREATE TABLE $zakatTable (
            $zakatId TEXT PRIMARY KEY,
            $goldAkhoutKyatthar Double NOT NULL,
            $goldAkhoutPae Double NOT NULL,
            $goldAkhoutYwae Double NOT NULL,
            $goldAhtaeKyatthar Double NOT NULL,
            $goldAhtaePae Double NOT NULL,
            $goldAhtaeYwae Double NOT NULL,
            $goldPyitceeKyatthar Double NOT NULL,
            $goldPyitceePae Double NOT NULL,
            $goldPyitceeYwae Double NOT NULL,
            $whiteSilverAkhoutKyatthar Double NOT NULL,
            $whiteSilverAkhoutPae Double NOT NULL,
            $whiteSilverAkhoutYwae Double NOT NULL,
            $whiteSilverAhtaeKyatthar Double NOT NULL,
            $whiteSilverAhtaePae Double NOT NULL,
            $whiteSilverAhtaeYwae Double NOT NULL,
            $whiteSilverPyitceeKyatthar Double NOT NULL,
            $whiteSilverPyitceePae Double NOT NULL,
            $whiteSilverPyitceeYwae Double NOT NULL,
            $silverAkhoutKyatthar Double NOT NULL,
            $silverAkhoutPae Double NOT NULL,
            $silverAkhoutYwae Double NOT NULL,
            $silverAhtaeKyatthar Double NOT NULL,
            $silverAhtaePae Double NOT NULL,
            $silverAhtaeYwae Double NOT NULL,
            $silverPyitceeKyatthar Double NOT NULL,
            $silverPyitceePae Double NOT NULL,
            $silverPyitceeYwae Double NOT NULL,
            $inHandSuHtarTaw Double NOT NULL,
            $inHandPyitceeSold Double NOT NULL,
            $inHandPyitceeBorrow Double NOT NULL,
            $inHandForeignCurrency Double NOT NULL,
            $inHandContract Double NOT NULL,
            $inHandOther Double NOT NULL,
            $inBankInBank Double NOT NULL,
            $inBankThuMyarHlwae Double NOT NULL,
            $inBankSalary Double NOT NULL,
            $inBankOther Double NOT NULL,
            $thuMyarDebtPyitceeSold Double NOT NULL,
            $thuMyarDebtChayPay Double NOT NULL,
            $thuMyarDebtAttHtrTaw Double NOT NULL,
            $thuMyarDebtOther Double NOT NULL,
            $realEstateSellHouse Double NOT NULL,
            $realEstateSellEscort Double NOT NULL,
            $realEstateSellCar Double NOT NULL,
            $realEstateOther Double NOT NULL,
            $rawWearhouse Double NOT NULL,
            $rawHome Double NOT NULL,
            $rawShop Double NOT NULL,
            $rawOther Double NOT NULL,
            $finishWearhouse Double NOT NULL,
            $finishHome Double NOT NULL,
            $finishShop Double NOT NULL,
            $finishAnimal Double NOT NULL,
            $finishOther Double NOT NULL,
            $sate Double NOT NULL,
            $thoe Double NOT NULL,
            $kalaout Double NOT NULL,
            $kywae Double NOT NULL,
            $nwar Double NOT NULL,
            $minusDebtMahur Double NOT NULL,
            $minusDebt Double NOT NULL,
            $minusSukyae Double NOT NULL,
            $minusMeterBill Double NOT NULL,
            $minusPaybill Double NOT NULL,
            $minusPaySalary Double NOT NULL,
            $minusPayRent Double NOT NULL,
            $minusBuyGoodPay Double NOT NULL,
            $minusPreZakat Double NOT NULL,
            $createdAt String NOT NULL,
            $updatedAt String NOT NULL,
            $goldRate Double NOT NULL,
            $silverRate Double NOT NULL,
            $yourWorth Double NOT NULL,
            $yourZakat Double NOT NULL,
            $yourZakatAnimal String NOT NULL
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

  Future<int> insertZakat(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(zakatTable, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<Result> queryAllCategoryRows(String query) async {
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

  Future<Result> queryAllZakatRows() async {
    Database db = await instance.database;
    final d = await db.query(zakatTable);

    List<Zakat> data = d.map((i) => Zakat.fromJson(i)).toList();
    return Result<List<Zakat>>.success(data);
  }

  Future<Result> queryZakatById(String id) async {
    Database db = await instance.database;
    final d =
        await db.query(zakatTable, where: '$zakatId = ?', whereArgs: ['$id']);

    List<Zakat> data = d.map((i) => Zakat.fromJson(i)).toList();
    return Result<Zakat>.success(data.first);
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

  Future<int?> queryZakatRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $zakatTable'));
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

  Future<int> updateZakat(Map<String, dynamic> row, String id) async {
    Database db = await instance.database;
    return await db
        .update(zakatTable, row, where: '$zakatId = ?', whereArgs: [id]);
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

  Future<int> deleteZakat(String id) async {
    Database db = await instance.database;
    return await db.delete(zakatTable, where: '$zakatId = ?', whereArgs: [id]);
  }
}
