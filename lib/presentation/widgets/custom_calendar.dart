import 'package:flutter/material.dart';
import 'calendar_custom.dart';
import '../helpers/helpers.dart';

class CustomDateCalendar extends StatelessWidget {
  const CustomDateCalendar(
      {super.key,
      required this.onChangedDate,
      this.initialDate,
      required this.date,
      this.positionedLeft,
      this.positionedRight,
      this.positionedBottom,
      this.positionedTop,
      this.fontSize = 16});

  final DateTime? initialDate;
  final DateTime date;
  final double? fontSize;
  final double? positionedLeft;
  final double? positionedRight;
  final double? positionedBottom;
  final double? positionedTop;
  final Function(DateTime) onChangedDate;

  @override
  Widget build(BuildContext context) {
    return CustomCalendarWidget(
      onChangedDate: onChangedDate,
      positionedTop: positionedTop,
      positionedLeft: positionedLeft,
      positionedRight: positionedRight,
      positionedBottom: positionedBottom,
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color.fromARGB(159, 205, 205, 205), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Helpers.formatDateForBRDate(date),
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                //height: 20.97 / 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
