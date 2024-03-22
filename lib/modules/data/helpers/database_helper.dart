// ignore_for_file: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  final  String tableName = 'period';
  static Database? _database;
  static const String dbName = 'period.db';

  get database async {
    if (_database != null) return _database;

    return await initDatabase();
  }

  initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            category TEXT,
            dateInit TEXT,
            dateFinal TEXT,
            meta1 TEXT,
            meta2 TEXT
          )
        ''');
    });
  }
}
