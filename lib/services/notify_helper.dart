import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

import '../models/task.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('appicon');
    tz.initializeTimeZones();

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  scheduledTaskNotification(int hour, int minutes, Task task) async {
    // int newTime = 5;
    await notificationsPlugin.zonedSchedule(
        0,
        'Theme Change 3 seconds ago',
        Get.isDarkMode ? 'Light Mode' : 'Day Mode',
        _converTime(hour, minutes),

        //tz.TZDateTime.now(tz.local).add( Duration(seconds: newTime)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          importance: Importance.max,
        )),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  // scheduledNotification() async {
  //   await notificationsPlugin.zonedSchedule(
  //       0,
  //       'Theme Change 3 seconds ago',
  //       Get.isDarkMode ? 'Light Mode' : 'Day Mode',
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails(
  //         'your channel id',
  //         'your channel name',
  //         importance: Importance.max,
  //       )),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }
// immediate notification
// notificationDetails() {
//   return const NotificationDetails(
//     android: AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       importance: Importance.max,
//       enableLights: true,
//     ),
//   );
// }
//   Future<void> showNotificationMessage({required String message}) async {
//     await notificationsPlugin.show(
//         0, 'Theme Changed', message, await notificationDetails());
//   }
}
