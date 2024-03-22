// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crud_flutter/modules/presentation/widgets/custom_calendar.dart';
import 'package:crud_flutter/modules/presentation/widgets/dropdown.dart';
import 'package:crud_flutter/modules/presentation/widgets/input_personalized.dart';

import '../../../controller/home_page_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/manrope.dart';

class EditNewPeriod extends StatefulWidget {
  const EditNewPeriod({super.key, required this.controller, required this.add});

  final HomePageController controller;
  final dynamic Function() add;

  @override
  State<EditNewPeriod> createState() => _EditNewPeriodState();
}

class _EditNewPeriodState extends State<EditNewPeriod> {
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
  }

  _buildAddProductsModal(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border.all(
              color: Color.fromARGB(180, 205, 205, 205),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Manrope(
                            text: "Editar Período",
                            color: Color.fromRGBO(46, 44, 52, 1),
                            size: 15,
                            font: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      alignment: Alignment.topRight,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                      color: Color.fromARGB(231, 217, 217, 217),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InputPersonalized(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Não pode ser vazio";
                          }
                          return null;
                        },
                        fontSize: 15,
                        maxLength: 15,
                        labelText: "Nomeie seu período",
                        controller: widget.controller.titleController,
                        obscure: false,
                        height: 45,
                        width: (size.width / 1.55),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 246, 250),
                    border: Border.symmetric(),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Manrope(
                              text: "Começa",
                              color: Color.fromARGB(255, 12, 11, 11),
                              font: FontWeight.w500,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: (size.width / 3.15),
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
                        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                        child: Divider(height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Manrope(
                              text: "Termina",
                              color: Color.fromARGB(255, 12, 11, 11),
                              font: FontWeight.w500,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                                width: (size.width / 3.15),
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
                        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                        child: Divider(height: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Manrope(
                              text: "Categoria",
                              color: Color.fromARGB(255, 12, 11, 11),
                              font: FontWeight.w500,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 45,
                              width: (size.width / 3.15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        159, 205, 205, 205),
                                    width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Manrope(
                      text: "Meta 1",
                      color: Color.fromARGB(255, 12, 11, 11),
                      font: FontWeight.w500,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    InputPersonalized(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (String? value) {
                        if (value!.isEmpty || value == "0") {
                          return "Valor não pode ser vazia ou igual a 0";
                        }
                        return null;
                      },
                      fontSize: 12,
                      labelText: "un",
                      controller: widget.controller.meta1,
                      obscure: false,
                      height: 45,
                      width: (size.width / 4),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(7),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: const Color.fromARGB(159, 205, 205, 205),
                          width: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Manrope(
                      text: "Meta 2",
                      color: Color.fromARGB(255, 12, 11, 11),
                      font: FontWeight.w500,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    InputPersonalized(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (String? value) {
                        if (value!.isEmpty || value == "0") {
                          return "Valor não pode ser vazia ou igual a 0";
                        }
                        return null;
                      },
                      fontSize: 12,
                      labelText: "un",
                      controller: widget.controller.meta2,
                      obscure: false,
                      height: 45,
                      width: (size.width / 4),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(7),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: const Color.fromARGB(159, 205, 205, 205),
                          width: 1),
                    ),
                  ],
                ),
                CustomButtonStandard(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: 30,
                  width: 90,
                  onTap: widget.add,
                  color: Color.fromARGB(247, 15, 40, 139),
                  text: "Concluir",
                  size: 15,
                  isLoading: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
