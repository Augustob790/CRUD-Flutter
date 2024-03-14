import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatefulWidget {
  final Widget child;
  final DateTime? initialDate;
  final double? positionedLeft;
  final double? positionedRight;
  final double? positionedBottom;
  final double? positionedTop;
  final Function(DateTime date) onChangedDate;

  const CustomCalendarWidget({
    super.key,
    required this.onChangedDate,
    required this.child,
    this.initialDate, this.positionedLeft, this.positionedRight, this.positionedBottom, this.positionedTop,
  });

  @override
  State<CustomCalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CustomCalendarWidget>
    with TickerProviderStateMixin {
  DateTime? currentDay;
  final LayerLink _layerLink = LayerLink();

  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  late AnimationController _animationController;

  void setCurrentDay(DateTime date) {
    setState(() {
      currentDay = date;
    });

    widget.onChangedDate.call(date);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  final yearInMonths = List.generate(12, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleDropdown(close: false);
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.child,
      ),
    );

    //  SizedBox(
    //   width: 282,
    //   child: TableCalendar(
    //     headerVisible: false,
    //     locale: 'pt_BR',
    //     currentDay: currentDay,
    //     onDaySelected: (selectedDay, focusedDay) {
    //       setCurrentDay(selectedDay);
    //     },
    //     firstDay: DateTime.utc(2010, 10, 16),
    //     lastDay: DateTime.utc(2030, 3, 14),
    //     focusedDay: DateTime.now(),
    //     availableGestures: AvailableGestures.horizontalSwipe,
    //   ),
    // );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () => _toggleDropdown(close: true),
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned(
                top: widget.positionedTop,
                left: widget.positionedLeft,
                right: widget.positionedRight,
                bottom: widget.positionedBottom,
                child: SizedBox(
                  width: 282,
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    child: ClipRRect(
                      child: TableCalendar(
                        locale: 'pt_BR',
                        currentDay: currentDay,
                        headerStyle: HeaderStyle(
                          leftChevronIcon: Container(),
                          rightChevronIcon: Container(),
                          titleCentered: true,
                          titleTextFormatter: (date, locale) =>
                              monthsName[date.month]!,
                          formatButtonVisible: false,
                        ),
                        onDaySelected: (selectedDay, focusedDay) {
                          setCurrentDay(selectedDay);
                          _toggleDropdown(close: true);
                        },
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: widget.initialDate ?? DateTime.now(),
                        availableGestures: AvailableGestures.horizontalSwipe,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final monthsName = {
  1: 'Janeiro',
  2: 'Fevereiro',
  3: 'Março',
  4: 'Abril',
  5: 'Maio',
  6: 'Junho',
  7: 'Julho',
  8: 'Agosto',
  9: 'Setembro',
  10: 'Outubro',
  11: 'Novembro',
  12: 'Dezembro',
};
