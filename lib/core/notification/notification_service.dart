import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationService {
  Future<void> initialize();
  Future<String?> getToken();
  Stream<RemoteMessage> get onMessageStream;
  Stream<RemoteMessage> get onNotificationOpenedStream;
}


