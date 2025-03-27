import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init({
    required void Function(String? payload) onNotificationClick,
  }) async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // 🔧 Kanal oluşturuluyor
    const androidChannel = AndroidNotificationChannel(
      'daily_channel_id_v2',
      'Daily Notifications',
      description: 'Daily reminder notification',
      importance: Importance.max,
    );
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          onNotificationClick(details.payload!);
        }
      },
    );
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }

  static Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    bool isTest = false, // true ise 2 dk sonra çalışır
  }) async {
    print('Bildirim planlanıyor...');

    tz.initializeTimeZones();
    final location = tz.getLocation('Europe/Istanbul');
    final now = tz.TZDateTime.now(location);

    tz.TZDateTime scheduledDate;

    if (isTest) {
      scheduledDate = now.add(const Duration(minutes: 2));
    } else {
      scheduledDate = tz.TZDateTime(location, now.year, now.month, now.day, 8);
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }
    }

    print('Scheduled time: $scheduledDate');

    const androidDetails = AndroidNotificationDetails(
      'daily_channel_id_v2',
      'Daily Notifications',
      channelDescription: 'Daily reminder notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: id.toString(),
      matchDateTimeComponents: DateTimeComponents.time,
    );

    print('Bildirim başarıyla planlandı');
  }
}
