import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project2/models/Medicine.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  static final String tableName = "Medicine";
  static final String databaseName = "medicine.db";
  static final String medicineIdColumnName = 'id';
  static final String medicineNameColumnName = 'medicineName';
  static final String medicineDosageColumnName = 'medicineDosage';
  static final String medicineTypeColumnName = 'medicineType';
  static final String intervalColumnName = 'interval';
  static final String startTimeColumnName = 'startTime';
  Database database;

  initDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$databaseName';
    Database database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
          '''CREATE TABLE $tableName ($medicineIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
          $medicineNameColumnName TEXT, $medicineDosageColumnName TEXT,
          $medicineTypeColumnName TEXT,$intervalColumnName INTEGER,$startTimeColumnName TEXT)''');
    });
    return database;
  }

  insertMedicine(Medicine medicine) async {
    int rowNum = await database.insert(tableName, medicine.toMap());
    print(rowNum);
  }

  Future<List<Medicine>> getAllMedicine() async {
    List<Map<String, dynamic>> result = await database.query(tableName);
    List<Medicine> medicines = result.map((e) => Medicine.fromMap(e)).toList();
    return medicines;
  }

  Future<Medicine> getSpecificMedicine(int id) async {
    List<Map<String, dynamic>> result =
        await database.query(tableName, where: 'id = ?', whereArgs: [id]);
    Medicine medicine = Medicine.fromMap(result.first);
    return medicine;
  }

  updateMedicine(Medicine medicine) async {
    await database.update(tableName, medicine.toMap(),
        where: 'id = ?', whereArgs: [medicine.medicineId]);
  }

  deleteMedicine(int id) async {
    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  getTablesName() async {
    List<Map<String, Object>> tables = await database
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    List<String> tablesName = tables.map((e) => e['name'].toString()).toList();
    print(tablesName);
  }
}
