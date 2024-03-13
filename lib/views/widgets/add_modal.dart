// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:teste_pleno/views/widgets/custom_calendar.dart';
import 'package:teste_pleno/views/widgets/dropdown.dart';
import 'package:teste_pleno/views/widgets/input_personalized.dart';

import '../../presentation/controller/home_page_controller.dart';
import 'custom_button.dart';
import 'manrope.dart';

class AddNewPeriod extends StatefulWidget {
  const AddNewPeriod({super.key, required this.controller, required this.add});
  // final OpinionsController controller;
  // final String local;
  // final String description;
  // final String text;
  // final int quant;
  // final String prefsName;
  // final SharedPreferences prefs;

  final HomePageController controller;
  final dynamic Function() add;

  @override
  State<AddNewPeriod> createState() => _PopUpOpinionsState();
}

class _PopUpOpinionsState extends State<AddNewPeriod> {
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  _buildAddProductsModal(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
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
                      controller: widget.controller.titleController,
                      //labelText: "Nomeie seu periodo",
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
                    color: Color.fromARGB(116, 236, 236, 237),
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
                              date: widget.controller.dateInit,
                              fontSize: 14,
                              onChangedDate: (DateTime date) {
                                setState(() {
                                  widget.controller.initializeInit(date);
                                });
                              },
                              positionedLeft: 65,
                              positionedTop: 130,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(height: 10),
                      ),
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
                                date: widget.controller.dateFinal,
                                fontSize: 14,
                                onChangedDate: (DateTime date) {
                                  widget.controller.initializeFinal(date);
                                },
                                positionedLeft: 65,
                                positionedTop: 130,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Divider(height: 10),
                      ),
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
                              child: DropdownButtonForm(
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Selecione a categoria';
                                  }
                                  return null;
                                },
                                onTap: (String? value) {
                                  widget.controller.onSelectedEstado(value ?? "");
                                },
                                value: widget.controller.dropdownStateValue,
                                lists: widget.controller.categoria,
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
                      controller: widget.controller.meta1,
                      //labelText: "Un",
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
                      controller: widget.controller.meta2,
                      //labelText: "Un",
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
                        onTap: widget.add,
                        color: Color.fromARGB(247, 15, 40, 139),
                        text: "Concluir",
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
    );
  }
}
