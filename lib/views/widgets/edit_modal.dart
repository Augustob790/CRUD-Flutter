// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:teste_pleno/views/widgets/custom_calendar.dart';
import 'package:teste_pleno/views/widgets/dropdown.dart';
import 'package:teste_pleno/views/widgets/input_personalized.dart';

import 'custom_button.dart';
import 'manrope.dart';

class EditNewPeriod extends StatefulWidget {
  const EditNewPeriod({super.key});
  // final OpinionsController controller;
  // final String local;
  // final String description;
  // final String text;
  // final int quant;
  // final String prefsName;
  // final SharedPreferences prefs;

  @override
  State<EditNewPeriod> createState() => _PopUpOpinionsState();
}

class _PopUpOpinionsState extends State<EditNewPeriod> {
  final TextEditingController contentController = TextEditingController();
  String dropdownStateValue = "Categoria";
  DateTime date = DateTime.now();
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

  // onSelectedEstado(String estadoName) {
  //                                     dropdownStateValue = estadoName;
  //                                     notifyListeners();
  //                                   }

  initialize(DateTime dateTime) async {
    date = dateTime;
  }

  initializeInit(DateTime dateTime) async {
    dateInit = dateTime;
  }

  @override
  void initState() {
    super.initState();
    initialize(DateTime.now());
    initializeInit(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  _buildAddProductsModal(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
      ModalBarrier(
          color: Colors.black.withOpacity(0.25),
          dismissible: true,
        ),
        AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: const Text(
                            "Nova Período",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(46, 44, 52, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Manrope(
                                text: "X",
                                size: 20,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputPersonalized(
                          validator: null,
                          controller: contentController,
                          labelText: "Nomeie seu periodo",
                          obscure: false,
                          height: 40,
                          width: (size.width / 1.78),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 210,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Manrope(
                                  text: "Começa",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                  font: FontWeight.w600,
                                  size: 14,
                                ),
                                const SizedBox(width: 5),
                                const Manrope(
                                  text: "4 de set. de 2023",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                            child: Divider(height: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Manrope(
                                  text: "Termina",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                  font: FontWeight.w600,
                                  size: 14,
                                ),
                                const SizedBox(width: 5),
                                const Manrope(
                                  text: "4 de set. de 2023",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                            child: Divider(height: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Manrope(
                                  text: "Categoria",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                  font: FontWeight.w600,
                                  size: 14,
                                ),
                                const SizedBox(width: 5),
                                const Manrope(
                                  text: "Categoria 5",
                                  color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Manrope(
                                text: "Meta 1",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w600,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              const Manrope(
                                text: "300",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Manrope(
                                text: "Meta 2",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w500,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              const Manrope(
                                text: "500",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                size: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonStandard(
                            height: 35,
                            width: 100,
                            onTap: () async {},
                            color: Color.fromARGB(255, 255, 0, 0),
                            text: "Excluir",
                            isLoading: true,
                          ),
                          CustomButtonStandard(
                            height: 35,
                            width: 100,
                            onTap: () async {},
                            color: Color.fromARGB(247, 15, 40, 139),
                            text: "Editar",
                            isLoading: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
