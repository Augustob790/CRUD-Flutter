import 'package:flutter/material.dart';

import 'manrope.dart';

class TextHomePage extends StatelessWidget {
  const TextHomePage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 12),
      child: Manrope(
        text: text,
        color: const Color.fromARGB(255, 12, 11, 11),
        font: FontWeight.w500,
        size: 17,
      ),
    );
  }
}
