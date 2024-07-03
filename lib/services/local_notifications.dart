import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static final _locaNotification = FlutterLocalNotificationsPlugin();

  static bool notificationsEnabled = false;

  static Future<void> requestPermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      notificationsEnabled = await _locaNotification
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;

      await _locaNotification
              .resolvePlatformSpecificImplementation<
                  MacOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    } else if (Platform.isAndroid) {
      final androidImplementation =
          await _locaNotification.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      final bool? grantedNotificationPermission =
          await androidImplementation?.requestNotificationsPermission();
      final bool? grantedScheduleNotificationPermission =
          await androidImplementation?.requestExactAlarmsPermission();

      notificationsEnabled = grantedNotificationPermission ?? false;
      notificationsEnabled = grantedScheduleNotificationPermission ?? false;
    }
  }

  static Future<void> start() async {
    // final currentTimeZone = await FlutterTimeline.get
  }

  static Future<void> showNotifications() async {}

  // static Future<void> requestPermission() async {}
}
