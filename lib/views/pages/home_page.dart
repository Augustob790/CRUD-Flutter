// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:teste_pleno/views/widgets/edit_modal.dart';
import '../../DB/database_helper.dart';
import '../../model/note.dart';
import '../widgets/custom_button.dart';
import '../widgets/manrope.dart';

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
        title: const Manrope(
          text: "Configurações",
          color: Color.fromARGB(255, 12, 11, 11),
          font: FontWeight.w400,
          size: 22,
        ),
        leading: TextButton(
          onPressed: () {},
          child: Manrope(
            text: "<",
            color: Color.fromARGB(255, 12, 11, 11),
            font: FontWeight.w400,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 155.0),
                        child: Manrope(
                          text: "Apelido",
                          color: Colors.black,
                          font: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 200,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(214, 187, 186, 186),
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(172, 236, 236, 237),
                      border: Border.all(
                          color: Color.fromARGB(255, 251, 248, 248), width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://exemplo.com/sua/imagem.jpg'),
                          ),
                        ),
                        Manrope(
                          text: "Editar Foto",
                          color: Colors.black,
                          font: FontWeight.w500,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 15),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 10),
                  child: Manrope(
                    text: "Períodos",
                    color: Color.fromARGB(255, 12, 11, 11),
                    font: FontWeight.w500,
                    size: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(116, 236, 236, 237),
                    // border: Border.all(
                    //     color: Color.fromARGB(116, 236, 236, 237), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                                color: const Color.fromARGB(51, 205, 205, 205),
                                width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Manrope(
                                text: note.title,
                                color: const Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w500,
                                size: 16,
                              ),
                            ),
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
                                              decoration: const InputDecoration(
                                                  labelText: 'Title'),
                                            ),
                                            TextField(
                                              controller: _contentController,
                                              decoration: const InputDecoration(
                                                  labelText: 'Content'),
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
                                              note.title =
                                                  _titleController.text;
                                              note.content =
                                                  _contentController.text;
                                              await _databaseHelper
                                                  .update(note);
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonStandard(
                    height: 25,
                    width: 120,
                    onTap: () async {
                      _titleController.clear();
                      _contentController.clear();
                      showDialog(
                          context: context,
                          builder: (context) => const EditNewPeriod());
                    },
                    color: Color.fromARGB(247, 15, 40, 139),
                    text: "Adicionar Pedido",
                    size: 12.0,
                    isLoading: true,
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://exemplo.com/sua/imagem.jpg'),
                  ),
                ),
                Column(
                  children: [
                    Manrope(
                      text: "João",
                      color: Color.fromARGB(255, 33, 8, 227),
                      font: FontWeight.w500,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Manrope(
                        decoration: TextDecoration.underline,
                        text: "Sair",
                        color: Color.fromARGB(255, 33, 8, 227),
                        font: FontWeight.w500,
                        size: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _titleController.clear();
      //     _contentController.clear();
      //     showDialog(
      //         context: context, builder: (context) => const EditNewPeriod());
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _titleController.clear();
      //     _contentController.clear();
      //     showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         title: const Text('Add Note'),
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             TextField(
      //               controller: _titleController,
      //               decoration: const InputDecoration(labelText: 'Title'),
      //             ),
      //             TextField(
      //               controller: _contentController,
      //               decoration: const InputDecoration(labelText: 'Content'),
      //             ),
      //           ],
      //         ),
      //         actions: [
      //           ElevatedButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             child: const Text('Cancel'),
      //           ),
      //           ElevatedButton(
      //             onPressed: () async {
      //               final title = _titleController.text;
      //               final content = _contentController.text;
      //               if (title.isNotEmpty && content.isNotEmpty) {
      //                 await _databaseHelper.insert(Note(
      //                   title: title,
      //                   content: content,
      //                 ));
      //                 _refreshNotes();
      //                 Navigator.pop(context);
      //               }
      //             },
      //             child: const Text('Save'),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
