// ignore_for_file: prefer_const_constructors

import 'package:crud_flutter/presentation/widgets/manrope.dart';
import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class CustomExit extends StatelessWidget {
  const CustomExit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Helpers.imageJoao),
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
    );
  }
}
