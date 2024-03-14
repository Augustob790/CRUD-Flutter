import 'package:crud_flutter/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../domain/model/ period_model.dart';
import 'manrope.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.period});

  final Period period;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Manrope(
              text: period.title,
              color: const Color.fromARGB(255, 12, 11, 11),
              font: FontWeight.w500,
              size: 16,
            ),
            Manrope(
              text:
                  "${Helpers.formatDateForBR(period.dataInit)} a ${Helpers.formatDateForBR(period.dateFinal)}",
              color: const Color.fromARGB(255, 12, 11, 11),
              font: FontWeight.w400,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
