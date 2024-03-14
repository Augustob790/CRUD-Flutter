// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:teste_pleno/presentation/pages/widgets/input_personalized.dart';
import 'package:teste_pleno/presentation/pages/widgets/mask.dart';

import '../../controller/home_page_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/manrope.dart';

class InfoPeriod extends StatefulWidget {
  const InfoPeriod(
      {super.key,
      required this.controller,
      required this.excluir,
      required this.editar,
      required this.category,
      required this.meta1,
      required this.meta2,
      required this.dateInit,
      required this.dateFinal});
  final String category;
  final String meta1;
  final String meta2;
  final String dateInit;
  final String dateFinal;

  final HomePageController controller;
  final dynamic Function() excluir;
  final dynamic Function() editar;

  @override
  State<InfoPeriod> createState() => _InfoPeriodState();
}

class _InfoPeriodState extends State<InfoPeriod> {
  @override
  Widget build(BuildContext context) {
    return _buildAddProductsModal(context);
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
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Manrope(
                                  text: "X",
                                  size: 20,
                                  color:
                                      const Color.fromARGB(255, 188, 188, 188),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 45,
                        width: (size.width / 1.74),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(27, 66, 66, 67),
                          border: Border.symmetric(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:  Manrope(
                            text: widget.controller.titleController.text,
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w500,
                            size: 14,
                          ),
                        ),
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
                                font: FontWeight.w500,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              Manrope(
                                text: Mask.formatDateForBR2(widget.dateInit),
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
                                font: FontWeight.w500,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              Manrope(
                                text: Mask.formatDateForBR2(widget.dateFinal),
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
                                font: FontWeight.w500,
                                size: 14,
                              ),
                              const SizedBox(width: 5),
                              Manrope(
                                text: widget.category,
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
                              font: FontWeight.w500,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            Manrope(
                              text: widget.meta1,
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
                            Manrope(
                              text: widget.meta2,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButtonStandard(
                          height: 35,
                          width: 100,
                          onTap: widget.excluir,
                          color: Color.fromARGB(255, 255, 0, 0),
                          text: "Excluir",
                          isLoading: true,
                        ),
                        CustomButtonStandard(
                          height: 35,
                          width: 100,
                          onTap: widget.editar,
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
    );
  }
}
