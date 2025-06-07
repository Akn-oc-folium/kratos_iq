import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime)? selectedDate;

  const CustomCalendar({Key? key, this.selectedDate}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendar();
}

class _CustomCalendar extends State<CustomCalendar> {
  static const double _monthRowHeight = 28.0;
  static const double _dayRowHeight = 28.0;

  static final Color _kSelectedColor = kcLime300;
  static final Color _kMonthText = kcGray900;
  static final Color _kDayText = kcGray800;
  static final Color _kFadedText = kcZinc300;

  late DateTime _now;
  late int _selectedYear;
  late int _selectedMonthIndex;
  late int _selectedDayOfMonth;
  late int _daysInSelectedMonth;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _selectedYear = _now.year;
    _selectedMonthIndex = _now.month - 1;
    _selectedDayOfMonth = _now.day;
    _daysInSelectedMonth = _daysInMonth(_selectedYear, _selectedMonthIndex + 1);
  }

  int _daysInMonth(int year, int month) {
    // Dart trick: the zeroth day of the next month is the last day of “month”
    if (month == 12) {
      return DateTime(year + 1, 1, 0).day;
    }
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double fullWidth = constraints.maxWidth;
        final double monthWidth = fullWidth / 12;
        _daysInSelectedMonth =
            _daysInMonth(_selectedYear, _selectedMonthIndex + 1);

        final double perDayWidth = fullWidth / _daysInSelectedMonth;

        return SizedBox(
          width: fullWidth,
          height: _monthRowHeight + _dayRowHeight,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Row(
                  children: List.generate(12, (monthIdx) {
                    final String name = _monthName(monthIdx);
                    final bool isSelectedMonth =
                        (monthIdx == _selectedMonthIndex);

                    final Color textColor;
                    if (monthIdx < _selectedMonthIndex) {
                      textColor = _kMonthText;
                    } else if (monthIdx == _selectedMonthIndex) {
                      textColor = kcZinc900;
                    } else {
                      textColor = _kFadedText;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMonthIndex = monthIdx;
                          _daysInSelectedMonth =
                              _daysInMonth(_selectedYear, monthIdx + 1);
                          if (_selectedDayOfMonth > _daysInSelectedMonth) {
                            _selectedDayOfMonth = _daysInSelectedMonth;
                          }
                        });
                      },
                      child: Container(
                        width: monthWidth,
                        height: _monthRowHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelectedMonth
                              ? _kSelectedColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          name,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: isSelectedMonth
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: _monthRowHeight,
                left: 0,
                child: SizedBox(
                  width: fullWidth,
                  height: _dayRowHeight,
                  child: Stack(
                    children: List.generate(_daysInSelectedMonth, (i) {
                      final int dayNum = i + 1;
                      final bool isSelectedDay =
                          (dayNum == _selectedDayOfMonth);
                      final bool isPastOrToday =
                          (dayNum <= _selectedDayOfMonth);

                      final Color textColor = isSelectedDay
                          ? kcZinc900
                          : (isPastOrToday ? _kDayText : _kFadedText);

                      final double xPos = i * perDayWidth;

                      return Positioned(
                        left: xPos,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDayOfMonth = dayNum;
                            });
                          },
                          child: SizedBox(
                            width: perDayWidth,
                            height: _dayRowHeight,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelectedDay
                                      ? _kSelectedColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '$dayNum',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelectedDay
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _monthName(int i) {
    const List<String> names = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return names[i];
  }
}
