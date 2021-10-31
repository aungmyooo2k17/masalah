import 'package:adhan/adhan.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:masalah/model/prayer_item/prayer_time_entity.dart';
import 'package:masalah/service/notification_service.dart';
import 'package:masalah/util/share_preference_util.dart';
import '../common/extension.dart';

final myCoordinates = Coordinates(16.7827, 96.1771);
final prayerNames = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
const ALARM_ID = 99;
const NOTIFICATION_ID = 91;

class AlarmScheduler {
  void scheduleAlarm(PrayerTimeEntity prayerTimeEntity) {}

  void cancelAlarm() {
    AndroidAlarmManager.cancel(ALARM_ID);
  }

  Future<void> setAlarm() async {
    bool nextAlarmFound = false;
    String? nameOfPrayerFound;
    DateTime? nextPrayerTime;
    PrayerTimes? prayerTimesInstance;

    final parameters = CalculationMethod.karachi.getParameters();
    parameters.madhab = Madhab.hanafi;
    prayerTimesInstance = PrayerTimes.today(myCoordinates, parameters);
    for (var prayerName in prayerNames) {
      final isAlarmEnable = await _isAlarmEnabledForPrayers(prayerName);
      if (!isAlarmEnable) {
        continue;
      }
      nextPrayerTime = prayerName.prayerTime(prayerTimesInstance);
      if (nextPrayerTime.isAfter(DateTime.now())) {
        nameOfPrayerFound = prayerName;
        nextAlarmFound = true;
        break;
      }
    }

    ///If current time is after today Isha,then do loop again and add 1 day to set alarm for next day fajr
    if (!nextAlarmFound) {
      for (var prayerName in prayerNames) {
        final isAlarmEnable = await _isAlarmEnabledForPrayers(prayerName);
        if (!isAlarmEnable) {
          continue;
        }
        nextPrayerTime = prayerName.prayerTime(prayerTimesInstance);
        if (nextPrayerTime.isBefore(DateTime.now())) {
          nameOfPrayerFound = prayerName;
          nextAlarmFound = true;
          nextPrayerTime = nextPrayerTime.add(Duration(days: 1));
          break;
        }
      }
    }
    if (!nextAlarmFound || nameOfPrayerFound == null || nextPrayerTime == null)
      return;
    setAlarmOnTime(nameOfPrayerFound, nextPrayerTime);
  }

  void setAlarmOnTime(String prayerName, DateTime prayerTime) async {
    await SharedPreferenceUtil().addIntToSF(
        SharedPreferenceUtil.ALARM_PRAYER_TIME,
        prayerTime.millisecondsSinceEpoch);
    await SharedPreferenceUtil()
        .addStringToSF(SharedPreferenceUtil.ALARM_PRAYER_NAME, prayerName);
    AndroidAlarmManager.oneShotAt(prayerTime, ALARM_ID, runOnAlarm,
        alarmClock: true,
        allowWhileIdle: true,
        exact: true,
        rescheduleOnReboot: true,
        wakeup: true);
  }

  Future<bool> _isAlarmEnabledForPrayers(String prayerName) async {
    if (prayerName == "Sunrise") return false;
    final mutedPrayerList = await SharedPreferenceUtil()
            .loadList(SharedPreferenceUtil.PRAYER_MUTE_LIST) ??
        [];
    if (mutedPrayerList.contains(prayerName)) {
      return false;
    }
    return true;
  }
}

void runOnAlarm() async {
  final prayerName = await SharedPreferenceUtil()
      .getStringValuesSF(SharedPreferenceUtil.ALARM_PRAYER_NAME);
  NotificationService().showNotification(
      id: NOTIFICATION_ID, body: 'This is body', title: prayerName);
  AlarmScheduler()
    ..cancelAlarm()
    ..setAlarm();
//   AndroidAlarmManager
//   ..cancel(ALARM_ID)
// ;
//   AlarmScheduler()..cancel.setAlarm();
}
