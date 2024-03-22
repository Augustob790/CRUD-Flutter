import 'package:crud_flutter/modules/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../domain/model/ period_model.dart';
import 'manrope.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.period, this.onTap});

  final Period period;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(180, 205, 205, 205),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Manrope(
                  text: period.title,
                  color: Colors.black,
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
        ),
      ),
    );
  }
}
