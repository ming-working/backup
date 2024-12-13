import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/models/user.dart';

class CloudStorageRepository extends GetxController {
  // Use Case
  // 1. Sign Up
  // 2. Edit the personal information
  static CloudStorageRepository get instance => Get.find();

  final FirebaseFirestore cloudStorage = FirebaseFirestore.instance;

  addTestData() async {
    try {
      await cloudStorage.collection('test').add({
        'timestamp': FieldValue.serverTimestamp(),
        'message': 'testfirestore message',
      });
      debugPrint('Data added successfully');
    } catch (e) {
      debugPrint('Failed to add data: $e');
    }
  }

  readTestData() async {
    try {
      QuerySnapshot querySnapshot = await cloudStorage.collection('test').get();
      for (var doc in querySnapshot.docs) {
        debugPrint('Document data: ${doc.data()}');
      }
    } catch (e) {
      debugPrint('Failed to read data: $e');
    }
  }

  // will edit the user data based on the data passed to the function.
  editUserData(
    String uid, // key
    dynamic value,
  ) async {
    await cloudStorage
        .collection('users')
        .doc(uid)
        .update(value)
        .whenComplete(() => null)
        .catchError((error) => ());
  }

  // will create the user document based on the value and uid where
  // uid is the key for document as well.
  createUserData(
    String uid, // key
    dynamic value,
  ) async {
    // TODO: add exception handling, if there is no document respective
    debugPrint('User data: $value');
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(uid).set(value);
      debugPrint('User data added successfully');
    } catch (e) {
      debugPrint('Failed to add user data: $e');
    }

    await cloudStorage
        .collection('users')
        .doc(uid)
        .set(value)
        .whenComplete(
          () => Get.snackbar(
            // if successful, open the SnackBar
            "Success",
            "Your Account has been created",
            snackPosition: SnackPosition.TOP,
            backgroundColor: green300.withOpacity(0.1),
            colorText: green900,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError(
      (error) {
        // if error, open the SnackBar
        Get.snackbar(
          "Error",
          "Something went wrong. Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: green300.withOpacity(0.1),
          colorText: supportingRed900,
        );
      },
    );
  }

  // will read the user data from collection using uid as key.
  readUserData(String? uid) async {
    try {
      final DocumentSnapshot snapshot = await cloudStorage
          .collection('users')
          .doc('5Y61EoFItTWVBxOPpOiDnm8sZ052')
          .get();
      //debugPrint('Document data user: ${snapshot.data()}');
      //debugPrint('Document data user: ${snapshot.data()}');
      final data = snapshot.data() as Map<String, dynamic>?;
      return SmartAgeUserModel(
        fullName: data?['fullName'],
        email: data?['email'],
        phoneNo: data?['phoneNo'],
      );
    } catch (e) {
      debugPrint('Failed to read data: $e');
    }
  }
}
