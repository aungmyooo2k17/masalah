import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';

import 'package:masalah/masalah_app.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';

import 'package:masalah/service/alarm_scheduler.dart';
import 'package:masalah/service/launcher_widget_service.dart';
import 'package:masalah/service/location_service.dart';

import 'di/get_it.dart' as getIt;
import 'service/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await NotificationService().init();
  AlarmScheduler().cancelAlarm();
  await AlarmScheduler().setAlarm();
  await getIt.init();
  //final myCoordinates = Coordinates(16.7827, 96.1771); // Replace with your own location lat, lng.

  PrayerTimePluginUtil().init(CurrentLatLng(16.7827, 96.1771));
  await LauncherWidgetService().sendDataToAppWidget();
  runApp(MasalahApp());
}
