// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotification {
//   static FlutterLocalNotificationsPlugin? flutterNotificationPlugin;
//   static AndroidNotificationDetails? androidSettings;

//   static Initializer() {
//     flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
//     androidSettings = AndroidNotificationDetails(
//         "111", "Background_task_Channel",
//         channelDescription: "Channel to test background task",
//         importance: Importance.high,
//         priority: Priority.max);
//     var androidInitialization = AndroidInitializationSettings('app_icon');
//     var initializationSettings =
//         InitializationSettings(android: androidInitialization, iOS: null);
//     flutterNotificationPlugin!.initialize(initializationSettings,
//         onSelectNotification: onNotificationSelect);
//   }

Future<void> onNotificationSelect(String? payload) async {}

//   static ShowOneTimeNotification(DateTime scheduledDate) async {
//     var notificationDetails =
//         NotificationDetails(android: androidSettings, iOS: null);
//     await flutterNotificationPlugin!.schedule(1, "Background Task notification",
//         "Data saved to database", scheduledDate, notificationDetails,
//         androidAllowWhileIdle: true);
//   }
// }
