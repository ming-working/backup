/*
  // Controller for fetching user data from the backend.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/models/user.dart';
import 'package:smartage_care/services/authentication/authenticate_repostiory.dart';
import 'package:smartage_care/services/authorization/authorization_repository.dart';
import 'package:smartage_care/services/local_storage/storage_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authenticationRepository = Get.put(AuthenticationRepository());
  final _userRepository = Get.put(UserRepository());
  final _storageController = Get.put(StorageController());

  /// Get User Email and Pass to UserRepository to fetch user record.
  getUserData() async {
    // TODO: need to change the implementation
    await Future.delayed(const Duration(seconds: 1));

    // get the uid from authentication repository
    final uid = _authenticationRepository.backendUser.value!.uid;
    //debugPrint("UID: $uid");

    if (await _storageController.getValues("fullName") != null) {
      var fullName = await _storageController.getValues("fullName");
      var email = await _storageController.getValues("email");
      var phoneNo = await _storageController.getValues("phoneNumber");

      return SmartAgeUserModel(
        fullName: fullName!,
        email: email!,
        phoneNo: phoneNo!,
      );
    } else {
      dynamic data = await _userRepository.getUserDetails(uid);

      await _storageController.setValue("fullName", data!.fullName);
      await _storageController.setValue("email", data.email);
      await _storageController.setValue("phoneNumber", data.phoneNo);

      return data;
    }
    // from authorization_repository.dart
    // if (uid) {
  }
}
