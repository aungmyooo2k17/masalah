import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init({bool initSchedule = false}) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, iOS: null, macOS: null);
    await _notifications.initialize(initializationSettings,
        onSelectNotification: null);

    // if (initSchedule) {
    //   tz.initializeTimeZones();
    //   final locationName = await FlutterNativeTimezone.getLocalTimezone();
    //   tz.setLocalLocation(tz.getLocation(locationName));
    // }
  }

  Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
            'adhan_alarm_channel', 'Adhan Alarm',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            sound:
                const RawResourceAndroidNotificationSound('slow_spring_board'),
            additionalFlags: Int32List.fromList(<int>[4])),
        iOS: IOSNotificationDetails());
  }

  //Show one-time instant notification
  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    _notifications.show(id, title, body, await _notificationDetails());
  }

  //Show one-time schedule notification
  void showScheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduleDate}) async {
    _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleDate, tz.local),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

//Show daily-schedule notification
  void showDailyScheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduleDate}) async {
    _notifications.zonedSchedule(
        id,
        title,
        body,
        _scheduleWeekly(const Time(8, 30),
            days: [DateTime.monday, DateTime.tuesday]),
        // _scheduleDaily(const Time(8,30)),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

  tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);

    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduleDate = _scheduleDaily(time);

    while (!days.contains(scheduleDate.weekday)) {
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }

    return scheduleDate;
  }
}
