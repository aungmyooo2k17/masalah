import 'package:flutter/material.dart';

import 'package:masalah/masalah_app.dart';

import 'package:masalah/service/alarm_scheduler.dart';

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

  runApp(MasalahApp());
}
