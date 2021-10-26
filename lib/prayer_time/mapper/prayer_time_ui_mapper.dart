import 'package:adhan/src/prayer.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/prayer_item/prayer_time_entity.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/util/date_time_util.dart';

class PrayerTimeUiMapper {
  List<UiPrayerTimeItem> mapUiPrayerItems(
          {required List<PrayerTimeEntity> prayerTimeList,
          DateTime? currentPrayerTime}) =>
      prayerTimeList
          .map((e) => mapUiPrayerItem(e, currentPrayerTime: currentPrayerTime))
          .toList();

  UiPrayerTimeItem mapUiPrayerItem(PrayerTimeEntity prayerTimeEntity,{DateTime? currentPrayerTime}) {
    return UiPrayerTimeItem(
        name: prayerTimeEntity.prayerName,
        isCurrentPrayerTime: prayerTimeEntity.prayerTime == currentPrayerTime,
        currentPrayerTime: DateTimeUtil().prayerTimeFormat(prayerTimeEntity.prayerTime),
        isMuteForCurrentPrayer: false);
  }

  UiPrayerTimeItemCard mapUiPrayerCardItem(
      PrayerTimeEntity currentPrayer, PrayerTimeEntity nextPrayerTime) {
    return UiPrayerTimeItemCard(
        currentPrayerTimeItem: mapUiPrayerItem(currentPrayer),
        nextPrayerName: nextPrayerTime.prayerName,
        nextPrayerTime:
            DateTimeUtil().prayerTimeFormat(nextPrayerTime.prayerTime),
        currentPrayerImage: _getPrayerImage(currentPrayer));
  }

  String _getPrayerImage(PrayerTimeEntity currentPrayer) {
    if (currentPrayer.prayerName == "Fajr") {
      return AppImages.fajr;
    }
    if (currentPrayer.prayerName == "Sunrise") {
      return AppImages.surise;
    }
    if (currentPrayer.prayerName == "Dhuhr") {
      return AppImages.duhr;
    }
    if (currentPrayer.prayerName == "Asr") {
      return AppImages.asir;
    }
    if (currentPrayer.prayerName == "Maghrib") {
      return AppImages.magrib;
    }
    if (currentPrayer.prayerName == "Isha") {
      return AppImages.isha;
    }
    return AppImages.magrib;
  }
}
