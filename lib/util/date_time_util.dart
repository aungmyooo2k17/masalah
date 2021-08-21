import 'package:intl/intl.dart';

class DateTimeUtil {
  prayerTimeFormat(datetime) {
    return DateFormat.jm().format(datetime);
  }
}
