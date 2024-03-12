import 'package:flutter/material.dart';
import 'package:teste_pleno/views/widgets/manrope.dart';

class DropdownButtonForm extends StatelessWidget {
  const DropdownButtonForm({super.key, required this.onTap, required this.value, required this.lists, this.initialValue, this.validator, this.color});
  final Function(String?) onTap;
  final String? value;
  final List<String> lists;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      icon: const Icon(
        Icons.arrow_downward,
        color: Color.fromARGB(0, 255, 193, 7),
      ),
      decoration: const InputDecoration(border: InputBorder.none),
      value: initialValue ?? value,
      onChanged: onTap,
      items: lists.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Manrope(
            text: value,
            color: const Color.fromARGB(255, 113, 113, 113),
            font: FontWeight.w500,
            size: 15,
          ),
        );
      }).toList(),
    );
  }
}