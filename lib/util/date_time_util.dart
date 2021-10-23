import 'package:intl/intl.dart';

class DateTimeUtil {
  prayerTimeFormat(datetime) {
    return DateFormat.jm().format(datetime);
    // return datetime;
  }

  prayerTimeHumanReadable(datetime) {
    return DateFormat.yMMMMd('en_US').format(datetime);
  }

  bool isCurrentDateTimeBetween(DateTime dateTime1, DateTime dateTime2) {
    final currentDateTime = DateTime.now();
    return currentDateTime.isAfter(dateTime1) &&
        currentDateTime.isBefore(dateTime2);
  }
}
