// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crud_flutter/presentation/pages/widgets/custom_calendar.dart';
import 'package:crud_flutter/presentation/pages/widgets/dropdown.dart';
import 'package:crud_flutter/presentation/pages/widgets/input_personalized.dart';

import '../../controller/home_page_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/manrope.dart';

class AddNewPeriod extends StatefulWidget {
  const AddNewPeriod({super.key, required this.controller, required this.add});

  final HomePageController controller;
  final dynamic Function() add;

  @override
  State<AddNewPeriod> createState() => _PopUpOpinionsState();
}

class _PopUpOpinionsState extends State<AddNewPeriod> {
  String textLabel = "Nomeie seu periodo";
  String un1 = "un";
  String un2 = "un";
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.inicialize();
  }

  _buildAddProductsModal(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: const Text(
                          "Novo Período",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(46, 44, 52, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Manrope(
                                  text: "X",
                                  size: 20,
                                  color: const Color.fromARGB(255, 188, 188, 188),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputPersonalized(
                          validator: null,
                          controller: widget.controller.titleController,
                          labelText: textLabel,
                          onChanged: (value) {
                            setState(() {
                              textLabel = '';
                            });
                          },
                          obscure: false,
                          height: 45,
                          width: (size.width / 1.74),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 165,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(27, 66, 66, 67),
                      border: Border.symmetric(),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Manrope(
                                text: "Começa",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: 120,
                                height: 30,
                                child: CustomDateCalendar(
                                  date: widget.controller.dateInit,
                                  fontSize: 12,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(height: 10),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Manrope(
                                text: "Termina",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: CustomDateCalendar(
                                    date: widget.controller.dateFinal,
                                    fontSize: 12,
                                    onChangedDate: (DateTime date) {
                                      setState(() {
                                        widget.controller.initializeFinal(date);
                                      });
                                    },
                                    positionedLeft: 65,
                                    positionedTop: 130,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(height: 10),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Manrope(
                                text: "Categoria",
                                color: Color.fromARGB(255, 12, 11, 11),
                                font: FontWeight.w400,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(252, 250, 247, 247),
                                  border: Border.symmetric(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                                      widget.controller
                                          .onSelectedCategory(value ?? "");
                                    },
                                    value:
                                        widget.controller.dropdownCategoryValue,
                                    lists: widget.controller.categoria,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Manrope(
                          text: "Meta 1",
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w400,
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        InputPersonalized(
                          keyboardType: TextInputType.number,
                          validator: null,
                          controller: widget.controller.meta1,
                          labelText: un1,
                          onChanged: (value) {
                            setState(() {
                              un1 = '';
                            });
                          },
                          obscure: false,
                          height: 45,
                          width: 100,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            LengthLimitingTextInputFormatter(7),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Manrope(
                          text: "Meta 2",
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w400,
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        InputPersonalized(
                          keyboardType: TextInputType.number,
                          validator: null,
                          controller: widget.controller.meta2,
                          labelText: un2,
                          onChanged: (value) {
                            setState(() {
                              un2 = '';
                            });
                          },
                          obscure: false,
                          height: 45,
                          width: 100,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            LengthLimitingTextInputFormatter(7),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
