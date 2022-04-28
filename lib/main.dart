import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

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
  await initPrayerTimes();

  runApp(MasalahApp());
}



initPrayerTimes() async{

  try{
    final currentLocation = await getIt.getItInstance<LocationService>().getCurrentLocation();
    if(currentLocation!=null){
      PrayerTimePluginUtil().init(currentLocation);
      await LauncherWidgetService().sendDataToAppWidget();


    }
  } catch(e){
    debugPrint(e.toString());
  }


}
