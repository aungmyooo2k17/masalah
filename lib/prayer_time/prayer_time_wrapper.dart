import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:masalah/model/prayer_item/prayer_time_entity.dart';
import 'package:masalah/common/extension.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/mapper/prayer_time_domain_mapper.dart';
import 'package:masalah/prayer_time/mapper/prayer_time_ui_mapper.dart';
import 'package:masalah/util/date_time_util.dart';

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

    // getUiPrayerItemCard();
  }

  void initWithOffset(Coordinates coordinates, DateTime selectDateTime) {
    final parameters = CalculationMethod.karachi.getParameters();
    parameters.madhab = Madhab.hanafi;
    final DateComponents dateComponents = DateComponents(
        selectDateTime.year, selectDateTime.month, selectDateTime.day);
    _prayerTimesPlugin = PrayerTimes.utcOffset(coordinates, dateComponents,
        parameters, Duration(hours: 6, minutes: 30));
    // test();
    getCurrentDatePrayers();
    // getUiPrayerItemCard();
  }

  PrayerTimeEntity getNextPrayerItem() {
    var nextPrayer = _prayerTimesPlugin.nextPrayer();
    DateTime? nextPrayerTime;
    if (nextPrayer == Prayer.none) {
      final currentDate = DateTime.now();
      nextPrayer = getPrayerIfLibNone(false);
      final myCoordinates = Coordinates(16.7827, 96.1771);
      final parameters = CalculationMethod.karachi.getParameters();
      parameters.madhab = Madhab.hanafi;
      final _pTimes = PrayerTimes(
          myCoordinates,
          DateComponents(
              currentDate.year, currentDate.month, currentDate.day + 1),
          parameters);

      nextPrayerTime = _pTimes.timeForPrayer(nextPrayer);

      debugPrint('Hello testing 12343 $nextPrayerTime');

      // _prayerTimesPlugin
    } else {
      nextPrayerTime = _prayerTimesPlugin.timeForPrayer(nextPrayer);
    }

    return PrayerTimeEntity(
        prayerName: nextPrayer.displayTitle, prayerTime: nextPrayerTime!);
  }

  PrayerTimeEntity getCurrentPrayerItem() {
    var currentPrayer = _prayerTimesPlugin.currentPrayer();
    DateTime? currentPrayerTime;
    if (currentPrayer == Prayer.none) {
      final currentDate = DateTime.now();
      currentPrayer = getPrayerIfLibNone(true);
      final myCoordinates = Coordinates(16.7827, 96.1771);
      final parameters = CalculationMethod.karachi.getParameters();
      parameters.madhab = Madhab.hanafi;
      final _pTimes = PrayerTimes(
          myCoordinates,
          DateComponents(
              currentDate.year, currentDate.month, currentDate.day - 1),
          parameters);

      currentPrayerTime = _pTimes.timeForPrayer(currentPrayer);
    } else {
      currentPrayerTime = _prayerTimesPlugin.timeForPrayer(currentPrayer);
    }

    return PrayerTimeEntity(
        prayerName: currentPrayer.displayTitle, prayerTime: currentPrayerTime!);
  }

  UiPrayerTimeItemCard getUiPrayerItemCard() {
    final uiMapper = PrayerTimeUiMapper();
    final currentPrayerEntity = getCurrentPrayerItem();

    final nextPrayerEntity = getNextPrayerItem();
    return uiMapper.mapUiPrayerCardItem(currentPrayerEntity, nextPrayerEntity);
  }

  Stream<List<UiPrayerTimeItem>> getCurrentDatePrayers() {
    final uiMapper = PrayerTimeUiMapper();
    final domainMapper = PrayerTimeDomainMapper();
    final currentPrayersList =
        domainMapper.getPrayerTimesEntity(_prayerTimesPlugin);

    return Stream.value(uiMapper.mapUiPrayerItems(
        prayerTimeList: currentPrayersList,
        currentPrayerTime: _prayerTimesPlugin
            .timeForPrayer(_prayerTimesPlugin.currentPrayer())));
  }

  Prayer getPrayerIfLibNone(bool isCurrent) {
    final currentDateTime = DateTime.now();

    ///PrayerTime plugin must be initialized with today

    if (DateTimeUtil().isCurrentDateTimeBetween(
        _prayerTimesPlugin.fajr, _prayerTimesPlugin.sunrise)) {
      return isCurrent ? Prayer.fajr : Prayer.sunrise;
    } else if (DateTimeUtil().isCurrentDateTimeBetween(
        _prayerTimesPlugin.sunrise, _prayerTimesPlugin.dhuhr)) {
      return isCurrent ? Prayer.sunrise : Prayer.dhuhr;
    } else if (DateTimeUtil().isCurrentDateTimeBetween(
        _prayerTimesPlugin.dhuhr, _prayerTimesPlugin.asr)) {
      return isCurrent ? Prayer.dhuhr : Prayer.asr;
    } else if (DateTimeUtil().isCurrentDateTimeBetween(
        _prayerTimesPlugin.asr, _prayerTimesPlugin.maghrib)) {
      return isCurrent ? Prayer.asr : Prayer.maghrib;
    } else if (DateTimeUtil().isCurrentDateTimeBetween(
        _prayerTimesPlugin.maghrib, _prayerTimesPlugin.isha)) {
      return isCurrent ? Prayer.maghrib : Prayer.isha;
    } else if (currentDateTime.isAfter(_prayerTimesPlugin.isha) ||
        currentDateTime.isBefore(_prayerTimesPlugin.fajr)) {
      return isCurrent ? Prayer.isha : Prayer.fajr;
    }
    return Prayer.none;
  }
}
