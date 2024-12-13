final List<LanguageModel> languages = [
  LanguageModel('English', 'en', 'US'),
  LanguageModel('繁體中文', 'zh', 'HK'),
  LanguageModel('简体中文', 'zh', 'CN'),
];

class LanguageModel {
  final String name;
  final String languageCode;
  final String countryCode;
  // final String countryCode;

  LanguageModel(
    this.name,
    this.languageCode,
    this.countryCode,
  );
}
