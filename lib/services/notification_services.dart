import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

class NotificationServices{
  static FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  static NotificationDetails notiDetails = NotificationDetails(
      android: AndroidNotificationDetails("1", "workout", importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    );

  static Future<void> init() async{
    notificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    AndroidInitializationSettings androidSettings = AndroidInitializationSettings("@mipmap/ic_launcher");
    DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
    InitializationSettings initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
    await notificationsPlugin.initialize(initSettings);
  }

  static void showNotification(int id, String title, String body){
    notificationsPlugin.show(id, title, body, notiDetails);
  }

  static void showPerodicNotification(int id, String title, String body){
    notificationsPlugin.periodicallyShow(id, title, body, RepeatInterval.everyMinute, notiDetails);
  }

  static void deleteNotification(int id){
    notificationsPlugin.cancel(id);
  }

  static void deleteAllNotifications(){
    notificationsPlugin.cancelAll();
  }

  static void scheduleNotification(int id, String title, String body, Duration duration) async{
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      TZDateTime.now(local).add(duration),
      notiDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
  }
}