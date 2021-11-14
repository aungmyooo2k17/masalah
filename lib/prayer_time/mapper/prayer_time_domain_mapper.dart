import 'package:adhan/adhan.dart';
import 'package:masalah/model/prayer_item/prayer_time_entity.dart';

class PrayerTimeDomainMapper {
  List<PrayerTimeEntity> getPrayerTimesEntity(PrayerTimes prayerTimes) {
    final prayerTimeEntities = <PrayerTimeEntity>[];
    return prayerTimeEntities
      ..add(PrayerTimeEntity(prayerName: 'Fajr', prayerTime: prayerTimes.fajr))
      ..add(
          PrayerTimeEntity(prayerName: 'Sunrise', prayerTime: prayerTimes.sunrise))
      ..add(PrayerTimeEntity(prayerName: 'Dhuhr', prayerTime: prayerTimes.dhuhr))
      ..add(PrayerTimeEntity(prayerName: 'Asr', prayerTime: prayerTimes.asr))
      ..add(
          PrayerTimeEntity(prayerName: 'Maghrib', prayerTime: prayerTimes.maghrib))
      ..add(PrayerTimeEntity(prayerName: 'Isha', prayerTime: prayerTimes.isha));
  }



  
}
