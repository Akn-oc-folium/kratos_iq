import 'package:intl/intl.dart';

class DateFormatter {
  String _daySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String formatWithOrdinal(String isoDate) {
    final date = DateTime.parse(isoDate);
    final day = date.day;
    final monthName = DateFormat('MMMM').format(date);
    final year = date.year;
    final suffix = _daySuffix(day);
    return '$monthName $day$suffix, $year';
  }
}
