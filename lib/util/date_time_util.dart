import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {



  DateTimeUtil._();
  static prayerTimeFormat(datetime) {
    return DateFormat.jm().format(datetime);
    // return datetime;
  }

  static prayerTimeHumanReadable(datetime) {
    return DateFormat.yMMMMd('en_US').format(datetime);
  }

  static bool isCurrentDateTimeBetween(DateTime dateTime1, DateTime dateTime2) {
    final currentDateTime = DateTime.now();
    return currentDateTime.isAfter(dateTime1) &&
        currentDateTime.isBefore(dateTime2);
  }


  static DateTime currentDay(){
    final currentDate = DateTime.now();
    return DateTime(currentDate.year,currentDate.month,currentDate.day);
  }

  static DateComponents currentDayComponent(){
        final currentDate = DateTime.now();
        return DateComponents(currentDate.year, currentDate.month, currentDate.day);

  }
}
