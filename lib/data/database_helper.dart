import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;
  static const String dbName = 'notes.db';
  static const String tableName = 'notes';

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

  // Future<int> insert(Note note) async {
  //   final db = await database;
  //   return await db!.insert(tableName, note.toMap());
  // }

  // Future<List<Note>> getAllNotes() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db!.query(tableName);
  //   return List.generate(maps.length, (i) {
  //     return Note.fromMap(maps[i]);
  //   });
  // }

  // Future<int> update(Note note) async {
  //   final db = await database;
  //   return await db!.update(
  //     tableName,
  //     note.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [note.id],
  //   );
  // }

  // Future<int> delete(int id) async {
  //   final db = await database;
  //   return await db!.delete(
  //     tableName,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}