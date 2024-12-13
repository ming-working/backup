import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/models/user.dart';
import 'package:smartage_care/services/cloud_storage/cloud_storage_repository.dart';
import 'package:smartage_care/services/notification/notification_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Cloud Storage Repository
  final cloudStorageRep = Get.put(CloudStorageRepository());

  // Notification Repository
  final notificationRep = Get.put(NotificationRepository());

  createUser(SmartAgeUserModel user, String uid) async {
    // Upload the user data to the Firebase 'user' Document.
    // User document primary key is uid.
    debugPrint(user.email);
    debugPrint(user.fullName);
    debugPrint('uid for store doc in firestore : $uid');
    user.deviceRegistrationToken =
        await notificationRep.getRegistractionToken();

    await cloudStorageRep.createUserData(uid, user.toJson());

    return null;
  }

  Future<SmartAgeUserModel?> getUserDetails(String? uid) async {
    // Getting docs with user id using Cloud Storage Repository
    cloudStorageRep.addTestData();
    //cloudStorageRep.readTestData();
    return await cloudStorageRep.readUserData(uid);
  }

  editUser(String uid, dynamic data) async {
    // edit the user data based on the data passed to the function.
    // it needs to be Json-type data.
    await cloudStorageRep.editUserData(
      uid,
      data, // JSON type!
    );
  }
}
