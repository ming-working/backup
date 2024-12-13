import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/services/authentication/authenticate_repostiory.dart';
import 'package:smartage_care/services/local_storage/storage_controller.dart';

class SignOutController extends GetxController {
  static SignOutController get instance => Get.find();

  final _storageController = Get.put(StorageController());

  void signOutUser() async {
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
      await AuthenticationRepository.instance.signOutUser();
      await _storageController.removeValue("fullName");
      await _storageController.removeValue("email");
      await _storageController.removeValue("phoneNumber");
      await _storageController.removeValue("registrationToken");
    } catch (e) {
      Get.snackbar(
        'Error signing out',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void howDialog(
      {required BuildContext context,
      required Function(dynamic context) builder}) {}
}
