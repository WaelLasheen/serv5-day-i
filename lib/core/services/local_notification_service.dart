import 'dart:math'; // استيراد مكتبة الـ Math لتوليد ID عشوائي صحيح
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // 1. تهيئة المكتبة (Initialization)
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // التعديل هنا: تمرير الـ initializationSettings مباشرة بدون كلمة settings:
    await _localNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (kDebugMode) {
          print(
            'User clicked on local notification. Payload: ${response.payload}',
          );
        }
      },
    );
  }

  // 2. دالة إظهار الإشعار الفوري
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // التعديل هنا: توليد ID عشوائي فريد تماماً لكل إشعار لتفادي مشاكل الأرقام المتكررة
    final int notificationId = Random().nextInt(100000);

    await _localNotificationsPlugin.show(
      id: notificationId,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload: payload,
    );
  }
}
