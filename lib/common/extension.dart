import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';

extension PrayerTimeExtension on Prayer {
  String get name => describeEnum(this);
  String get displayTitle {
    switch (this) {
      case Prayer.fajr:
        return 'Fajr';
      case Prayer.sunrise:
        return 'Sunrise';
      case Prayer.dhuhr:
        return 'Dhuhr';
      case Prayer.asr:
        return 'Asr';
      case Prayer.maghrib:
        return 'Maghrib';
      case Prayer.isha:
        return 'Isha';
      default:
        return throw Exception('Prayer is null');
    }
  }
}
