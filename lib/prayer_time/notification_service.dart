import 'dart:typed_data';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   static final NotificationService _notificationService =
//       NotificationService._internal();

//   factory NotificationService() {
//     return _notificationService;
//   }
//   NotificationService._internal();

//   final _notifications = FlutterLocalNotificationsPlugin();


// //    Future<void> init({bool initSchedule = false}) async {
// //     const AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('app_icon');

// //     const InitializationSettings initializationSettings =
// //         InitializationSettings(
// //             android: initializationSettingsAndroid, iOS: null, macOS: null);
// //     await _notifications.initialize(initializationSettings,
// //         onSelectNotification: null);

// //     if (initSchedule) {
// //       // tz.initializeTimeZones();
// //       // final locationName = await FlutterNativeTimezone.getLocalTimezone();
// //       // tz.setLocalLocation(tz.getLocation(locationName));
// //     }
// //   }

// //    Future _notificationDetails() async {
// //     return NotificationDetails(
// //         android:
// //             AndroidNotificationDetails('adhan_alarm_channel', 'Adhan Alarm',
// //                 importance: Importance.max,
// //                 priority: Priority.high,
                
// //                 playSound: true,

// //                 sound: const RawResourceAndroidNotificationSound('slow_spring_board'),
// //                 additionalFlags: Int32List.fromList(<int>[4])),
// //         iOS: IOSNotificationDetails());
//   }


// }
