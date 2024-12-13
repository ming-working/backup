import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/screens/main_screen/dashboard.dart';

class NotificationRepository extends GetxController {
  static NotificationRepository get instance => Get.find();

  // Initialize the instance of FirebaseMessaging
  final notificationClient = FirebaseMessaging.instance;

  static Future<void> init() async {
    // request the permission
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Get initial Message
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          // handle the message
          // TODO: figure out how to get the information from the message
          Get.offAll(
            () => const Dashboard(),
          );
        }
      },
    );

    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          final title = message.notification?.title ?? "";
          final body = message.notification?.body ?? "";
          Get.snackbar(
            title,
            body,
            barBlur: 50,
            duration: const Duration(seconds: 20),
            margin: const EdgeInsets.all(4),
            onTap: (message) {
              Get.offAll(
                () => const Dashboard(),
              );
            },
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        //AndroidNotification? android = message.notification?.android;

        Get.offAll(
          () => const Dashboard(),
        );
      },
    );

    FirebaseMessaging.onBackgroundMessage(backgroundMessageHander);
  }

  // Function to initialize the notification
  Future<String> getRegistractionToken() async {
    // Request permission for notification

    // Get the Device Registration Token
    debugPrint('Getting Device Registration Token');
    final String? deviceRegistrationToken = await notificationClient.getToken();
    debugPrint('Device Registration Token: $deviceRegistrationToken');
    return deviceRegistrationToken ?? "";
  }

  // Function to handle received message

  // Function to subscribe to the announcement topic
  Future<bool> subscribeToAnnouncement() async {
    try {
      await notificationClient.subscribeToTopic("topics-broadcasting");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> subscribeToTopic(String topic) async {
    try {
      await notificationClient.subscribeToTopic(topic);
      return true;
    } catch (e) {
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////
  //                        Message Handling                      //
  //////////////////////////////////////////////////////////////////

  void handleForegroundMessage(RemoteMessage message) {
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
    }
    if (message.data.isNotEmpty) {
      print('Message Data: ${message.data}');
    }
  }
}

Future<void> backgroundMessageHander(RemoteMessage message) async {
  await Firebase.initializeApp();
  Get.offAll(
    () => const Dashboard(),
  );
}
