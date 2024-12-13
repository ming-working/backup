// this is the repository class that will call Firebase Authentication API
// actual implementation for decoupling of different objects

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartage_care/screens/main_screen/dashboard.dart';
import 'package:smartage_care/screens/welcome_screen/welcome_screen.dart';
import 'package:smartage_care/services/authentication/authentication_exception.dart';
import 'package:smartage_care/services/cloud_storage/cloud_storage_repository.dart';
import 'package:smartage_care/services/notification/notification_repository.dart';

class AuthenticationRepository extends GetxController {
  // initialize the Firebase Authentication Repository instance
  // so that the instance can be used for the other classes
  static AuthenticationRepository get instance =>
      Get.find<AuthenticationRepository>();

  // initialize the FirebaseAuth Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Cloud Storage Repository for the user data upload when sign up
  final CloudStorageRepository cloudStorageRep =
      Get.put(CloudStorageRepository());

  // Notifiaction Repository for get the fcm token of the device for authentication event
  final NotificationRepository notificationRep =
      Get.put(NotificationRepository());

  // Rx is a class that is used to store the data in the device cache
  late final Rx<User?> backendUser = Rx<User?>(null);
  // once the data has been obtained from the backend database, it will be stored in the device cache, i.e., mobile device.

  @override
  void onReady() {
    super.onReady();

    // uncomment this if there is a explicit and custom splash Screen
    // Future.delayed(const Duration(seconds: 5));

    // getting the value of the user from Firebase Authentication.
    backendUser.value = _auth.currentUser;

    // bind the backendUser to the Data Stream to keep checking the Authentication state
    // userChaanges method will return Stream<User?>
    backendUser.bindStream(_auth.userChanges());

    // if something new happens, setInitialScreen will be executed to show the correct screen respectively.
    ever(backendUser, _setInitialScreen);
  }

  _setInitialScreen(User? callback) {
    callback == null
        ? // if the user data is null -> go to the Welcome Screen -> showing login and register
        Get.offAll(
            () => const WelcomeScreen(),
          )
        : // if the user data is not null -> go to the Dashboard Screen -> showing the main screen
        Get.offAll(
            () => const Dashboard(),
          );
  }

  Future<UserCredential?> signUpUserEmailPassword(
      String email, String password) async {
    // create and update the information to the cloud as well.
    try {
      // create the user with the email and password on the Firebase Authentication
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // return the user Credential once Register Process has been completed.
      // will used for creating user directory on firestore
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Cannot Register!',
        getMessageErrorCode(e.code),
        snackPosition: SnackPosition.TOP,
      );
    }
    return null;
  }

  Future<List<String?>?> signInUserEmailPassword(
      String email, String password) async {
    try {
      // Sign in using email and password
      // on Firebase Authentication
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // get the user id and the token for the notification
      final uid = credential.user?.uid;
      final token = await notificationRep.getRegistractionToken();

      // return the user id and the token list
      // for updating FCM token
      return [uid, token];
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Cannot Log In!',
        getMessageErrorCode(e.code),
        snackPosition: SnackPosition.TOP,
      );
    }
    return null;
  }

  signOutUser() async {
    // let the user sign out
    await _auth.signOut();
  }
}
