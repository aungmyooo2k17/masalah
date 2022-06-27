
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';

import 'location_service.dart';

class LauncherWidgetService {
  static final LauncherWidgetService _launcherWidget =
      LauncherWidgetService._internal();

  factory LauncherWidgetService() {
    return _launcherWidget;
  }
  LauncherWidgetService._internal();

  Future<void> sendDataToAppWidget() async {
    if(Platform.isIOS)return;
    final prayerTimes = await PrayerTimePluginUtil().getCurrentDatePrayers();

    final prayerTimesString =
        prayerTimes.map((e) => e.currentPrayerTime).toList().join(',');

    _sendAndUpdate(prayerTimesString);
  }

  Future<void> _sendAndUpdate(String data) async {
    await _sendData(data);
    await _updateWidget();
  }

  Future<void> _sendData(String data) async {
    try {
      Future.wait([
        HomeWidget.saveWidgetData<String>('prayerTime', data),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  Future<void> _updateWidget() async {
    try {
      HomeWidget.updateWidget(
          name: 'AppWidgetProvider', iOSName: 'HomeWidgetExample');
    } on PlatformException catch (e) {
      debugPrint('Error Updating Widget. $e');
    }
  }


  /// Called when Doing Background Work initiated from Widget
  static void backgroundCallback(Uri? data) async {

    debugPrint('Clicked $data');

    if (data?.host == 'refreshclicked') {

    //  PrayerTimePluginUtil().init(CurrentLatLng(16.7827, 96.1771));
      await LauncherWidgetService().sendDataToAppWidget();

    }
  }
}
