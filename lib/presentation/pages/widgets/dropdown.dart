import 'package:flutter/material.dart';
import 'package:crud_flutter/presentation/pages/widgets/manrope.dart';

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
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      decoration: const InputDecoration(border: InputBorder.none),
      value: initialValue ?? value,
      onChanged: onTap,
      items: lists.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Manrope(
            text: value,
            color: Colors.black,
            font: FontWeight.w400,
            size: 13,
          ),
        );
      }).toList(),
    );
  }
}