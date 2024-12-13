import 'dart:ui';

import 'package:get/get.dart';

class TranslationController extends GetxController {
  var selectedLanguage = Get.locale?.obs ?? const Locale("en", "US").obs;
  // var selectedLanguage = "${Get.locale?.languageCode}_${Get.locale?.countryCode}".obs;
  // there should be zh

  void changeLanguage(Locale lang) {
    Get.updateLocale(lang);
    // TODO: remove print after implementation
    selectedLanguage.value = lang;
  }

  // set changeLanguage(String lang) {
  //   Locale locale = Locale(lang);
  //   Get.updateLocale(locale);
  //   selectedLanguage.value = lang;
  // }
}
