import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../networking/i_api_service.dart'; // مسار الـ ApiService بتاعك
import 'local_notification_service.dart'; // الـ Import بتاع ملف المكتبة المحلية الجديد

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final IApiService _apiService;

  NotificationService(this._apiService);

  // 1. الدالة الرئيسية لتشغيل كل حاجة أول ما الأبلكيشن يفتح
  Future<void> initNotifications() async {
    // تهيئة مكتبة الإشعارات المحلية أولاً
    await LocalNotificationService.init();

    // طلب الصلاحية من المستخدم (مهم جداً للأندرويد 13+ والـ iOS)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted notification permission.');

      // جلب الـ Token وجدولة إرساله للباك إند
      await _getAndSaveFCMToken();

      // تشغيل مستمعي الإشعارات (Foreground & Background)
      _setupNotificationListeners();
    } else {
      log('User declined or has not accepted notification permission.');
    }
  }

  // 2. دالة جلب الـ Token وإرساله للـ API
  Future<void> _getAndSaveFCMToken() async {
    try {
      String? token = await _fcm.getToken();
      log('=============== FCM TOKEN ===============');
      log('$token');
      log('=========================================');

      if (token != null) {
        await _sendTokenToBackend(token);
      }

      // الاستماع في حال تغير الـ Token والتطبيق شغال
      _fcm.onTokenRefresh.listen((newToken) async {
        log('FCM Token Refreshed: $newToken');
        await _sendTokenToBackend(newToken);
      });
    } catch (e) {
      log('Error getting FCM Token: $e');
    }
  }

  // 3. رمي الـ Token على الـ API (جاهزة ومقفولة لحد ما الباك يجهز)
  Future<void> _sendTokenToBackend(String token) async {
    try {
      log('Using: ${_apiService.runtimeType} to prepare token upload.');
      // أول ما الباك إند يديك الـ Endpoint، شيل الـ Comment ده وباصي الـ URL الصح
      /*
      await _apiService.post(
        'YOUR_BACKEND_ENDPOINT_HERE',
        data: {'fcm_token': token},
      );
      log('FCM Token successfully sent to backend.');
      */
    } catch (e) {
      log('Failed to send FCM Token to backend: $e');
    }
  }

  // 4. الاستماع للإشعارات والتطبيق مفتوح لمنع الـ Silence
  void _setupNotificationListeners() {
    // تفعيل ظهور الـ Banner والتطبيق مفتوح على الأنظمة التي تدعم ذلك تلقائياً
    _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // الاستماع للإشعارات القادمة والتطبيق في الـ Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('جاء إشعار والتطبيق مفتوح: ${message.notification?.title}');

      // إظهار الإشعار يدوياً للمستخدم عبر الـ Local Notifications وهو فاتح الأبليكيشن
      if (message.notification != null) {
        LocalNotificationService.showSimpleNotification(
          title: message.notification!.title ?? '',
          body: message.notification!.body ?? '',
          payload: message.data
              .toString(), // باصي الـ Data لو الباك إند باعت داتا مخفية للـ Click
        );
      }
    });
  }
}
