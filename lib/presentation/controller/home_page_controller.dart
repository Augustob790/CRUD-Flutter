import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/database_helper.dart';
import '../../domain/model/ period.dart';

class HomePageController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController meta1 = TextEditingController();
  final TextEditingController meta2 = TextEditingController();
  late Database db;
  static const String tableName = 'notes';
  String dropdownCategoryValue = "Categoria";
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
  List<Period> notes = [];

  inicialize() {
    titleController.text = "";
    meta1.text = "";
    meta2.text = "";
    dropdownCategoryValue = "Categoria";
    dateInit = DateTime.now();
    dateFinal = DateTime.now();
  }

  onSelectedCategory(String category) {
    dropdownCategoryValue = category;
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

  insert(Period period) async {
    final db = await DB.instance.database;
    await db!.insert(tableName, period.toMap());
    notifyListeners();
  }

  getAllNotes() async {
    final db = await DB.instance.database;
    final List<Map<String, dynamic>> maps = await db!.query(tableName);
    notes = List.generate(maps.length, (i) {
      return Period.fromMap(maps[i]);
    });
    notifyListeners();
  }

  update(Period period) async {
    final db = await DB.instance.database;
    db!.update(
      tableName,
      period.toMap(),
      where: 'id = ?',
      whereArgs: [period.id],
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
