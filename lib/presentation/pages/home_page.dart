// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_flutter/presentation/pages/info/info_modal.dart';
import '../../const/image_const.dart';
import '../../domain/model/ period.dart';
import 'add/add_modal.dart';
import 'widgets/custom_button.dart';
import 'edit/edit_modal.dart';
import 'widgets/manrope.dart';
import 'widgets/mask.dart';
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
    controller.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Manrope(
          text: "Configurações",
          color: Color.fromARGB(255, 12, 11, 11),
          font: FontWeight.w500,
          size: 22,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<HomePageController>(
                builder: (context, controller, child) {
              return Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Manrope(
                                text: "Apelido",
                                color: Colors.black,
                                font: FontWeight.w500,
                                size: 13,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color.fromARGB(214, 187, 186, 186),
                                      width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(117, 197, 197, 197),
                            border: Border.all(
                                color: Color.fromARGB(255, 251, 248, 248),
                                width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 44,
                                width: 44,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(ImageConstant.imageNotFound),
                                ),
                              ),
                              SizedBox(width: 5),
                              Manrope(
                                text: "Editar Foto",
                                color: Colors.black,
                                font: FontWeight.w500,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 40),
                    Manrope(
                      text: "Períodos",
                      color: Color.fromARGB(255, 12, 11, 11),
                      font: FontWeight.w500,
                      size: 18,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(116, 236, 236, 237),
                          // border: Border.all(
                          //     color: Color.fromARGB(116, 236, 236, 237), width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
                          shrinkWrap: true,
                          itemCount: controller.notes.length,
                          itemBuilder: (context, index) {
                            final note = controller.notes[index];
                            return Container(
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
                                              controller.titleController.text =
                                                  note.title;
                                              controller.onSelectedCategory(
                                                  note.category);
                                              controller.dateFinal =
                                                  DateTime.parse(note.dateFinal);
                                              controller.dateInit =
                                                  DateTime.parse(note.dataInit);
                                              controller.meta1.text = note.meta1;
                                              controller.meta2.text = note.meta2;
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      EditNewPeriod(
                                                          controller: controller,
                                                          add: () async {
                                                            if (controller
                                                                    .titleController
                                                                    .text
                                                                    .isNotEmpty &&
                                                                controller
                                                                    .dropdownCategoryValue
                                                                    .isNotEmpty) {
                                                              await controller
                                                                  .update(Period(
                                                                id: note.id,
                                                                title: controller
                                                                    .titleController
                                                                    .text,
                                                                category: controller
                                                                    .dropdownCategoryValue,
                                                                dataInit: controller
                                                                    .dateInit
                                                                    .toIso8601String(),
                                                                dateFinal: controller
                                                                    .dateFinal
                                                                    .toIso8601String(),
                                                                meta1: controller
                                                                    .meta1.text,
                                                                meta2: controller
                                                                    .meta2.text,
                                                              ));
                                                            }
                                                            controller
                                                                .getAllNotes();
                                                            Navigator.pop(
                                                                context);
                                                          }));
                                            },
                                          ));
                                },
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Manrope(
                                          text: note.title,
                                          color: const Color.fromARGB(
                                              255, 12, 11, 11),
                                          font: FontWeight.w500,
                                          size: 16,
                                        ),
                                        Manrope(
                                          text:"${Mask.formatDateForBR(note.dataInit)} a ${Mask.formatDateForBR(note.dateFinal)}",
                                          color: const Color.fromARGB(
                                              255, 12, 11, 11),
                                          font: FontWeight.w400,
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomButtonStandard(
                        height: 25,
                        width: 120,
                        onTap: () async {
                          controller.inicialize();
                          controller.dateInit = DateTime.now();
                          controller.dateFinal = DateTime.now();
                          showDialog(
                              context: context,
                              builder: (context) => AddNewPeriod(
                                  controller: controller,
                                  add: () async {
                                    if (controller.titleController.text
                                            .isNotEmpty &&
                                        controller.dropdownCategoryValue
                                            .isNotEmpty) {
                                      await controller.insert(Period(
                                        title:
                                            controller.titleController.text,
                                        category: controller
                                            .dropdownCategoryValue,
                                        dataInit: controller.dateInit
                                            .toIso8601String(),
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
                        text: "Adicionar Período",
                        size: 12.0,
                        isLoading: true,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(ImageConstant.imageNotFound),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      children: const [
                        Manrope(
                          text: "João",
                          color: Color.fromARGB(247, 15, 40, 139),
                          font: FontWeight.w500,
                          size: 18,
                        ),
                        Manrope(
                          decoration: TextDecoration.underline,
                          text: "Sair",
                          color: Color.fromARGB(247, 15, 40, 139),
                          font: FontWeight.w500,
                          size: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
