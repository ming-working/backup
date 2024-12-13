import "package:firebase_core/firebase_core.dart";
import 'package:get/get.dart';
import 'package:smartage_care/services/authentication/authenticate_repostiory.dart';
import 'package:smartage_care/services/notification/notification_repository.dart';
import '../firebase_options.dart';

// BackendController class to initialize the backend system

// Notification and Database communication initialization will be implemented as well.

class ServiceInitializer {
  // can make a function for comprehensive backend initialization here

  // Firebase Core initalize
  static Future<void> initializeBackend() async {
    // Firebase Core initialization
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then(
      (value) => Get.put(
        AuthenticationRepository(),
      ),
    );

    // Firebase Database

    // Firebase Authentication

    // Firebase Notification
    await NotificationRepository.init().then(
      (value) => Get.put(
        NotificationRepository(),
      ),
    );

    // subscribe to the announcement
    await NotificationRepository().subscribeToAnnouncement();

    // TODO: find the functions to add and implement the initialization here.
  }
}
