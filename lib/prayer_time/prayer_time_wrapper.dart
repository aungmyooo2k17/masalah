import 'package:adhan/adhan.dart';
import 'package:masalah/model/prayer_item/prayer_time_entity.dart';
import 'package:masalah/common/extension.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/mapper/prayer_time_domain_mapper.dart';
import 'package:masalah/prayer_time/mapper/prayer_time_ui_mapper.dart';

abstract class PrayerTimeWrapper {}

class PrayerTimePluginUtil {
  late PrayerTimes _prayerTimesPlugin;

  static final PrayerTimePluginUtil _prayerTimeService =
      PrayerTimePluginUtil._internal();

  factory PrayerTimePluginUtil() {
    return _prayerTimeService;
  }
  PrayerTimePluginUtil._internal();

  void init(Coordinates coordinates) {
    final parameters = CalculationMethod.karachi.getParameters();
    parameters.madhab = Madhab.hanafi;
    _prayerTimesPlugin = PrayerTimes.today(coordinates, parameters);
  }

  void initWithOffset(Coordinates coordinates, DateTime selectDateTime) {
    final parameters = CalculationMethod.karachi.getParameters();
    parameters.madhab = Madhab.hanafi;
    final DateComponents dateComponents = DateComponents(
        selectDateTime.year, selectDateTime.month, selectDateTime.day);
    _prayerTimesPlugin = PrayerTimes.utcOffset(coordinates, dateComponents,
        parameters, Duration(hours: 6, minutes: 30));
  }

  PrayerTimeEntity getNextPrayerItem() {
    final nextPrayer = _prayerTimesPlugin.nextPrayer();
    final nextPrayerTime = _prayerTimesPlugin.timeForPrayer(nextPrayer);
    return PrayerTimeEntity(
        prayerName: nextPrayer.displayTitle, prayerTime: nextPrayerTime!);
  }

  PrayerTimeEntity getCurrentPrayerItem() {
    final currentPrayer = _prayerTimesPlugin.currentPrayer();
    final currentPrayerTime = _prayerTimesPlugin.timeForPrayer(currentPrayer);
    return PrayerTimeEntity(
        prayerName: currentPrayer.displayTitle, prayerTime: currentPrayerTime!);
  }

  UiPrayerTimeItemCard getUiPrayerItemCard() {
    final uiMapper = PrayerTimeUiMapper();
    final nextPrayerEntity = getNextPrayerItem();
    final currentPrayerEntity = getCurrentPrayerItem();
    return uiMapper.mapUiPrayerCardItem(currentPrayerEntity, nextPrayerEntity);
  }

  List<UiPrayerTimeItem> getCurrentDatePrayers() {
    final uiMapper = PrayerTimeUiMapper();
    final domainMapper = PrayerTimeDomainMapper();
    final currentPrayersList =
        domainMapper.getPrayerTimesEntity(_prayerTimesPlugin);
    return uiMapper.mapUiPrayerItems(currentPrayersList);
  }
}
