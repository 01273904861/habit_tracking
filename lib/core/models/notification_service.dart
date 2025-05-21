import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo')); // ✅ Set Cairo timezone

    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosInitSettings =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    final InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await _notificationsPlugin.initialize(initSettings);
  }
  static Future<void> scheduleDailyNotification({
  required int id,
  required String title,
  required String body,
  required int hour,
  required int minute,
}) async {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  final tz.TZDateTime cairoNow = tz.TZDateTime.from(now, tz.getLocation('Africa/Cairo'));

  tz.TZDateTime scheduledDate = tz.TZDateTime(
    tz.getLocation('Africa/Cairo'),
    cairoNow.year,
    cairoNow.month,
    cairoNow.day,
    hour,
    minute,
  );

  if (scheduledDate.isBefore(cairoNow)) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }

  const AndroidNotificationDetails androidDetails =
      AndroidNotificationDetails(
    'channel_id',
    'Daily Notifications',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails details = NotificationDetails(
    android: androidDetails,
    iOS: DarwinNotificationDetails(),
  );

  print("Scheduling notification at: $scheduledDate"); // Debugging log

  await _notificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    scheduledDate,
    details,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: DateTimeComponents.time,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}

}
