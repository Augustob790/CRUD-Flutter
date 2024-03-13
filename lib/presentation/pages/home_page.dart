// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_pleno/views/widgets/info_modal.dart';
import '../../model/note.dart';
import '../../views/widgets/add_modal.dart';
import '../../views/widgets/custom_button.dart';
import '../../views/widgets/edit_modal.dart';
import '../../views/widgets/manrope.dart';
import '../../views/widgets/mask.dart';
import '../controller/home_page_controller.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  HomePageController controller = HomePageController();

  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HomePageController>(context, listen: false);
    controller.initializeInit(DateTime.now());
    controller.initializeFinal(DateTime.now());
    controller.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<HomePageController>(builder: (context, controller, child) {
            return Column(
              children: [
                Row(
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
                            color: Color.fromARGB(255, 251, 248, 248),
                            width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, left: 5.0),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  height: 300,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(116, 236, 236, 237),
                      // border: Border.all(
                      //     color: Color.fromARGB(116, 236, 236, 237), width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: controller.notes.length,
                      itemBuilder: (context, index) {
                        final note = controller.notes[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: Color.fromARGB(180, 205, 205, 205),
                                width: 1,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.titleController.text = note.title;
                                showDialog(
                                    context: context,
                                    builder: (context) => InfoPeriod(
                                          controller: controller,
                                          category: note.category,
                                          meta1: note.meta1,
                                          meta2: note.meta2,
                                          dateInit: note.dataInit,
                                          dateFinal: note.dateFinal,
                                          excluir: () async {
                                            await controller.delete(note.id!);
                                            controller.getAllNotes();
                                            Navigator.pop(context);
                                          },
                                          editar: () async {
                                            Navigator.pop(context);
                                            controller.titleController.text = note.title;
                                            controller.onSelectedEstado(note.category);
                                            controller.dateFinal = DateTime.parse(note.dateFinal);
                                            controller.dateInit = DateTime.parse(note.dataInit);
                                            controller.meta1.text = note.meta1;
                                            controller.meta2.text =  note.meta2;
                                            showDialog(
                                            context: context,
                                            builder: (context) => EditNewPeriod(
                                            controller: controller,
                                            add: () async {
                                              if (controller.titleController.text.isNotEmpty && controller.dropdownStateValue.isNotEmpty) {
                                                await controller.update(Period(
                                                  id: note.id,
                                                  title: controller.titleController.text,
                                                  category: controller.dropdownStateValue,
                                                  dataInit:  controller.dateInit.toIso8601String(),
                                                  dateFinal: controller.dateFinal.toIso8601String(),
                                                  meta1: controller.meta1.text,
                                                  meta2: controller.meta2.text,
                                                ));
                                              }
                                              controller.getAllNotes();
                                              Navigator.pop(context);
                                            }));
                                             },
                                             ));
                              },
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom:15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Manrope(
                                        text: note.title,
                                        color:const Color.fromARGB(255, 12, 11, 11),
                                        font: FontWeight.w500,
                                        size: 16,
                                      ),
                                       Manrope(
                                        text: "${Mask.formatDateForBR(note.dataInit)} a ${Mask.formatDateForBR(note.dateFinal)}",
                                        color:const Color.fromARGB(255, 12, 11, 11),
                                        font: FontWeight.w400,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
                          controller.titleController.clear();
                          showDialog(
                              context: context,
                              builder: (context) => AddNewPeriod(
                                  controller: controller,
                                  add: () async {
                                    if (controller
                                            .titleController.text.isNotEmpty &&
                                        controller
                                            .dropdownStateValue.isNotEmpty) {
                                      await controller.insert(Period(
                                        title: controller.titleController.text,
                                        category: controller.dropdownStateValue,
                                        dataInit:
                                            controller.dateInit.toIso8601String(),
                                        dateFinal: controller.dateFinal
                                            .toIso8601String(),
                                        meta1: controller.meta1.text,
                                        meta2: controller.meta2.text,
                                      ));
                                      controller.getAllNotes();
                                      Navigator.pop(context);
                                    }
                                  }));
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
            );
          }),
        ),
      ),
    );
  }
}
