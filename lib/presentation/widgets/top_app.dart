import 'package:crud_flutter/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'manrope.dart';

class TopApp extends StatelessWidget {
  const TopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Manrope(
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
                      color: const Color.fromARGB(214, 187, 186, 186), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 225, 230, 230),
            border:
                Border.all(color: const Color.fromARGB(255, 251, 248, 248), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 44,
                width: 44,
                child: CircleAvatar(
                  backgroundImage: AssetImage(Helpers.imageJoao),
                ),
              ),
              const SizedBox(width: 5),
              const Manrope(
                text: "Editar Foto",
                color: Colors.black,
                font: FontWeight.w500,
                size: 13,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
