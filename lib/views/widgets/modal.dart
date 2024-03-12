// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:teste_pleno/views/widgets/custom_calendar.dart';
import 'package:teste_pleno/views/widgets/dropdown.dart';
import 'package:teste_pleno/views/widgets/inputtext.dart';

import 'custom_button.dart';
import 'manrope.dart';

class PopUpOpinions extends StatefulWidget {
  const PopUpOpinions({super.key});
  // final OpinionsController controller;
  // final String local;
  // final String description;
  // final String text;
  // final int quant;
  // final String prefsName;
  // final SharedPreferences prefs;

  @override
  State<PopUpOpinions> createState() => _PopUpOpinionsState();
}

class _PopUpOpinionsState extends State<PopUpOpinions> {
  bool isPositiveOpinion = false; // Adiciona o estado para controlar a opinião
  bool isNotPositiveOpinion = false;
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
    return Container(
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
        child: Column(
          children: [
            Column(
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
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(141, 207, 207, 207),
                    border: Border.symmetric(),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Manrope(
                            text: "Começa",
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w600,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 120,
                            height: 30,
                            child: CustomDateCalendar(
                              date: dateInit,
                              fontSize: 14,
                              onChangedDate: (DateTime date) {
                                setState(() {
                                  initializeInit(date);
                                });
                              },
                              positionedLeft: 65,
                              positionedTop: 130,
                            ),
                          )
                        ],
                      ),
                      Divider(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Manrope(
                            text: "Termina",
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w600,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                              width: 120,
                              height: 30,
                              child: CustomDateCalendar(
                                date: date,
                                fontSize: 14,
                                onChangedDate: (DateTime date) {
                                  setState(() {
                                    initialize(date);
                                  });
                                },
                              positionedLeft: 65,
                              positionedTop: 130,
                              )),
                        ],
                      ),
                      Divider(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Manrope(
                            text: "Categoria",
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w600,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(252, 250, 247, 247),
                              border: Border.symmetric(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Expanded(
                                child: DropdownButtonForm(
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Selecione a categoria';
                                    }
                                    return null;
                                  },
                                  onTap: (String? value) {},
                                  value: dropdownStateValue,
                                  lists: categoria,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                    InputPersonalized(
                      validator: null,
                      controller: contentController,
                      labelText: "Un",
                      obscure: false,
                      height: 40,
                      width: 80,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Manrope(
                      text: "Meta 2",
                      color: Color.fromARGB(255, 12, 11, 11),
                      font: FontWeight.w600,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    InputPersonalized(
                      validator: null,
                      controller: contentController,
                      labelText: "Un",
                      obscure: false,
                      height: 40,
                      width: 80,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonStandard(
                        height: 35,
                        width: 100,
                        onTap: () async {},
                        color: Color.fromARGB(215, 12, 12, 188),
                        text: "Concluir",
                        isLoading: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
