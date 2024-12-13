import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/models/user.dart';
import 'package:smartage_care/services/authentication/authenticate_repostiory.dart';
import 'package:smartage_care/services/authorization/authorization_repository.dart';
// import 'package:smartage_care/models/user.dart';

class SignUpController extends GetxController {
  // get the instance of the controller
  static SignUpController get instance => Get.find();

  // userRepository
  final userRepository = Get.put(UserRepository());

  /* Modify the list of information needed in the future */
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkPassword = TextEditingController();
  /* 
  Full Name
  HKID
  Phone Number
  Bank Account Details (?)
  Signed Consent Form -> check box
    // I have read and agreed to the Terms and Conditions
    // Text Button: Terms and Conditions
  */

  void registerUser(SmartAgeUserModel user) async {
    // Firebase Logic using the Authentication Repository to create a new user.
    try {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: green900,
              ),
            ),
          );
        },
      );
      final userCredential =
          await AuthenticationRepository.instance.signUpUserEmailPassword(
        user.email,
        user.password,
      );
      final uid = userCredential!.user?.uid;
      await createUserOnSignUp(user, uid!);
    } catch (e) {
      // Get.snackbar(
      //   'Error Signing Up',
      //   e.toString(),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  }

  Future<void> createUserOnSignUp(
    SmartAgeUserModel user,
    String uid,
  ) async {
    debugPrint('User data: ${user.toJson()}'); // Debugging
    await userRepository.createUser(user, uid);
    phoneAuthentication(user.phoneNo);
    // Go to the OTP Screen
  }

  void phoneAuthentication(String phoneNo) {}
}
