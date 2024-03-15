// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:crud_flutter/presentation/helpers/helpers.dart';

import '../../controller/home_page_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/manrope.dart';

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
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                          text: "Período",
                          color: Color.fromRGBO(46, 44, 52, 1),
                          size: 15,
                          font: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 246, 250),
                        border: Border.symmetric(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Manrope(
                          text: widget.controller.titleController.text,
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Manrope(
                          text: "Começa",
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w500,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Manrope(
                          text: Helpers.formatDateForBR2(widget.dateInit),
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w400,
                          size: 12,
                        ),
                      ],
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
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Manrope(
                            text: Helpers.formatDateForBR2(widget.dateFinal),
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w400,
                            size: 12,
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
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Manrope(
                            text: widget.category,
                            color: Color.fromARGB(255, 12, 11, 11),
                            font: FontWeight.w400,
                            size: 12,
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
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Manrope(
                          text: widget.meta1,
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w400,
                          size: 12,
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
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Manrope(
                          text: widget.meta2,
                          color: Color.fromARGB(255, 12, 11, 11),
                          font: FontWeight.w400,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonStandard(
                    margin: const EdgeInsets.only(top: 30, bottom: 30, left: 10),
                    height: 30,
                    width: 90,
                    onTap: widget.excluir,
                    color: Color.fromARGB(255, 255, 0, 0),
                    text: "Excluir",
                    size: 15,
                    isLoading: true,
                  ),
                  CustomButtonStandard(
                    margin: const EdgeInsets.only(top: 30, bottom: 30, right: 10),
                    height: 30,
                    width: 90,
                    onTap: widget.editar,
                    color: Color.fromARGB(247, 15, 40, 139),
                    text: "Editar",
                    size: 15,
                    isLoading: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
