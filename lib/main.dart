// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:teste_pleno/model/note.dart';
import 'DB/database_helper.dart';
import 'views/widgets/modal.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Note> _notes = [];

  //  initialize(DateTime dateTime) async {
  //   changeLoading(true);
  //   date = dateTime;
  //   await getOrdersByInspetionDate(day: date.day, month: date.month, year: date.year);
  //   changeLoading(false);
  // }



  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() async {
    List<Note> notes = await _databaseHelper.getAllNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _titleController.text = note.title;
                    _contentController.text = note.content;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Edit Note'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(labelText: 'Title'),
                            ),
                            TextField(
                              controller: _contentController,
                              decoration: const InputDecoration(labelText: 'Content'),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              note.title = _titleController.text;
                              note.content = _contentController.text;
                              await _databaseHelper.update(note);
                              _refreshNotes();
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await _databaseHelper.delete(note.id!);
                    _refreshNotes();
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _titleController.clear();
          _contentController.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
            backgroundColor: const Color.fromRGBO(46, 44, 52, 0),
            content: SizedBox(
                        width: double.maxFinite, // 
                        child: PopUpOpinions(),
            )
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
