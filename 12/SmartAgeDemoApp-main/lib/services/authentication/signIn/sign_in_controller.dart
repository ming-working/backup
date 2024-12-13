import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/services/authentication/authenticate_repostiory.dart';
import 'package:smartage_care/services/authorization/authorization_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  final email = TextEditingController();
  final password = TextEditingController();

  void signInUser() async {
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
      // sign in and get the uid and token information
      final credentials =
          await AuthenticationRepository.instance.signInUserEmailPassword(
        email.text.trim(),
        password.text.trim(),
      );

      await editUserOnSignIn(
        credentials?[0],
        credentials?[1],
      );
    } catch (e) {}
  }

  Future<void> editUserOnSignIn(String? uid, String? token) async {
    await userRepository.editUser(
      uid!,
      {
        "deviceRegistrationToken": token!,
      },
    );
  }
}
