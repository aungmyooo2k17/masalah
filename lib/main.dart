import 'dart:io';

import 'package:flutter/material.dart';

import 'package:masalah/masalah_app.dart';

import 'package:masalah/service/alarm_scheduler.dart';

import 'di/get_it.dart' as getIt;
import 'service/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await NotificationService().init();
  AlarmScheduler().cancelAlarm();
  await AlarmScheduler().setAlarm();
  await getIt.init();

  runApp(MasalahApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
