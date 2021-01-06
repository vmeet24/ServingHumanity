import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onBackgroundMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serialiseAndNavigate(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );
  }

  _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];
  }
}
