import 'package:get/get.dart';
import 'package:smartage_care/services/local_storage/storage_repository.dart';
import 'package:smartage_care/services/notification/notification_repository.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final storageController = Get.put(StorageRepository());

  // Function to initialize the notification
  Future<String?> storeRegistractionToken() async {
    // Request permission for notification

    // Get the Device Registration Token
    final deviceRegistrationToken =
        NotificationRepository.instance.notificationClient.getToken();

    // Store the device registration token in the local storage
    await storageController.setValue(
      'deviceRegistrationToken',
      deviceRegistrationToken as String,
    );

    return deviceRegistrationToken;
  }

  // Function to handle received message
  void handleMessage(Map<String, dynamic>? message) {
    if (message == null) {
      return;
    }

    // going to MessageScreen()
    // How do we store the notification? based on which key?
    Get.toNamed('/message');
  }

  // Function to initialize foreground and background settings for notification
  Future initPushNotification() async {
    // handle the notification if the app is terminated
    // FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // event listener for when a notification opens the app.
    // FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
