import 'package:firebase_messaging/firebase_messaging.dart';

class MyFirebaseMessagingService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // Function to initialize Firebase Messaging
  Future<void> initialize() async {
    // Request permission for notifications (for iOS)
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Notifications Permission Granted");
    } else {
      print("Notifications Permission Denied");
    }

    // Get the FCM token
    String? token = await _messaging.getToken();
    print("FCM Token: $token");

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Message Received: ${message.notification?.title}");
    });

    // Listen for background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background Message Received: ${message.notification?.title}");
}
