import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:masalah/common/extensions/string_extensions.dart';

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
        return '';
    }
  }
}

extension StringExtension on String {
  DateTime prayerTime(PrayerTimes prayerTimes) {
    switch (this) {
      case "Fajr":
        return prayerTimes.fajr;
      case "Sunrise":
        return prayerTimes.sunrise;
      case "Dhuhr":
        return prayerTimes.dhuhr;
      case "Asr":
        return prayerTimes.asr;
      case "Maghrib":
        return prayerTimes.maghrib;
      case "Isha":
        return prayerTimes.isha;
      default:
        return DateTime.now();
    }
  }
}
