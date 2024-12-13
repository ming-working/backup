import 'package:flutter/material.dart';
import 'package:smartage_care/models/language.dart';
import 'package:smartage_care/services/localization/translation_controller.dart';

DropdownButton languageChooser(TranslationController t) {
  return DropdownButton<String>(
    isExpanded: false,
    value:
        "${t.selectedLanguage.value.languageCode}_${t.selectedLanguage.value.countryCode}",
    onChanged: (symbol) {
      Locale locale = Locale(symbol!.substring(0, 2), symbol.substring(3));
      t.changeLanguage(locale);
    },
    items: languages.map((LanguageModel language) {
      return DropdownMenuItem(
        value: "${language.languageCode}_${language.countryCode}",

        // value: "${_language.languageCode}_${_language.countryCode}",
        child: Text(language.name),
      );
    }).toList(),
  );
}
