import 'package:intl/intl.dart';

class DateTimeUtil {
  prayerTimeFormat(datetime) {
    return DateFormat.jm().format(datetime);
  }

  prayerTimeHumanReadable(datetime) {
    return DateFormat.yMMMMd('en_US').format(datetime);
  }
}
