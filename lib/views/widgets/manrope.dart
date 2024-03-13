import 'package:flutter/material.dart';

class Manrope extends StatelessWidget {
  const Manrope({super.key, required this.text, this.font, this.size, this.aling, this.color, this.maxLines, this.letterSpacing, this.overflow, this.decoration = TextDecoration.none,});

  final String text;
  final dynamic font;
  final double? size;
  final double? letterSpacing;
  final TextAlign? aling;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: aling,
      style: TextStyle(
        decoration: decoration,
        decorationColor: color,// Cor do sublinhado
        fontFamily: "Manrope",
        fontWeight: font,
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
        overflow: overflow,
      ),
      maxLines: maxLines,
    );
  }
}
