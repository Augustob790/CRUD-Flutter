import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/database_helper.dart';
import '../../model/note.dart';

class HomePageController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController meta1 = TextEditingController();
  final TextEditingController meta2 = TextEditingController();
  late Database db;
  static const String tableName = 'notes';
  String dropdownStateValue = "Categoria";
  DateTime dateFinal = DateTime.now();
  DateTime dateInit = DateTime.now();
  List<String> categoria = [
    'Categoria',
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4',
    'Categoria 5',
    'Categoria 6',
  ];
  List<Note> notes = [];

  onSelectedEstado(String estadoName) {
    dropdownStateValue = estadoName;
    notifyListeners();
  }

  initializeInit(DateTime dateTime) async {
    dateInit = dateTime;
    notifyListeners();
  }

  initializeFinal(DateTime dateTime) async {
    dateFinal = dateTime;
    notifyListeners();
  }

  insert(Note note) async {
    final db = await DB.instance.database;
    await db!.insert(tableName, note.toMap());
    notifyListeners();
  }

  getAllNotes() async {
    final db = await DB.instance.database;
    final List<Map<String, dynamic>> maps = await db!.query(tableName);
    notes = List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
    notifyListeners();
  }

  update(Note note) async {
    final db = await DB.instance.database;
    db!.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
    notifyListeners();
  }

  delete(int id) async {
    final db = await DB.instance.database;
    await db!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  }
}
