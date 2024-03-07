import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'bmi_results';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'bmi_results.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, bmi_result TEXT, result_text TEXT, recommend_text TEXT)',
        );
      },
    );
  }

  Future<void> insertResult(
      String bmiResult, String resultText, String recommendText) async {
    Database db = await database;
    await db.insert(
      tableName,
      {
        'bmi_result': bmiResult,
        'result_text': resultText,
        'recommend_text': recommendText,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getResults() async {
    Database db = await database;
    return await db.query(tableName);
  }
}
