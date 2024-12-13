import 'package:get/get.dart';
import 'package:smartage_care/services/local_storage/storage_repository.dart';

class StorageController extends GetxController {
  static StorageController get instance => Get.find();

  // Storage Repository
  final storageRepository = Get.put(StorageRepository());

  Future<bool> setValue(String key, String value) async {
    return await storageRepository.setValue(key, value);
  }

  Future<String?> getValues(String key) async {
    return await storageRepository.getValues(key);
  }

  Future<bool> removeValue(String key) async {
    return await storageRepository.removeValue(key);
  }
}
