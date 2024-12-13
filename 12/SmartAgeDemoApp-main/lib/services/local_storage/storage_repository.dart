import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* 
  will make a use of shared preference supported by flutter to store data locally
  not sure what to save here.
*/

class StorageRepository extends GetxController {
  static StorageRepository get instance => Get.find();

  // Set the value
  Future<bool> setValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    final result = await prefs.setString(key, value);

    // Will return true or false based on the result
    // true -> store has been done successfully.
    // false -> store has not been done.
    return result;
  }

  // Get the value
  Future<String?> getValues(String key) async {
    final prefs = await SharedPreferences.getInstance();

    final result = prefs.getString(key);

    return result;
  }

  // Remove the value
  Future<bool> removeValue(String key) async {
    final prefs = await SharedPreferences.getInstance();

    final result = await prefs.remove(key);

    return result;
  }
}
