/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 568 (189 per locale)
///
/// Built on 2024-01-04 at 04:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.zhCn;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  zhCn(languageCode: 'zh', countryCode: 'CN', build: _StringsZhCn.build),
  zhHk(languageCode: 'zh', countryCode: 'HK', build: _StringsZhHk.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _StringsMainScreenEn mainScreen = _StringsMainScreenEn._(_root);
  late final _StringsWarningScreenEn warningScreen =
      _StringsWarningScreenEn._(_root);
  late final _StringsProfileScreenEn profileScreen =
      _StringsProfileScreenEn._(_root);
  late final _StringsTGlobalEn tGlobal = _StringsTGlobalEn._(_root);
  late final _StringsNoticeControlEn noticeControl =
      _StringsNoticeControlEn._(_root);
  late final _StringsCircleOfSupportScreenEn circleOfSupportScreen =
      _StringsCircleOfSupportScreenEn._(_root);
  late final _StringsActivityReportEn activityReport =
      _StringsActivityReportEn._(_root);
  late final _StringsChatListPageEn chatListPage =
      _StringsChatListPageEn._(_root);
  late final _StringsReportWidgetEn reportWidget =
      _StringsReportWidgetEn._(_root);
  late final _StringsSettingsEn Settings = _StringsSettingsEn._(_root);
  late final _StringsQuestionEn Question = _StringsQuestionEn._(_root);
  late final _StringsNotificationEn Notification =
      _StringsNotificationEn._(_root);
  late final _StringsChatEn Chat = _StringsChatEn._(_root);
  Map<String, String> get locales => {
        'en_US': 'English',
        'zh_HK': '中文(繁體)',
        'zh_CN': '中文(简体)',
      };
}

// Path: mainScreen
class _StringsMainScreenEn {
  _StringsMainScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Dad\'s Health Overview';
  late final _StringsMainScreenIconTextEn iconText =
      _StringsMainScreenIconTextEn._(_root);
  List<String> get tRooms => [
        '------',
        'Bedroom',
        'Bathroom',
        'Kitchen',
      ];
  List<String> get tCNRooms => [
        '------',
        'Bedroom',
        'Bathroom',
        'Kitchen',
      ];
  String get tapMe => 'Testing Eng';
  late final _StringsMainScreenWarningEn warning =
      _StringsMainScreenWarningEn._(_root);
  late final _StringsMainScreenHealthBlockEn healthBlock =
      _StringsMainScreenHealthBlockEn._(_root);
}

// Path: warningScreen
class _StringsWarningScreenEn {
  _StringsWarningScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tWarningTitle => 'Health Alerts';
  String get tFormTitle => 'Assistant Form';
  String get tNormalText => 'Normal';
  String get tAbnormalText => 'Abnormal';
  String get tWarningText => 'Warning';
  String get tContactElderly => 'Contact Elderly';
  String get tSettleNow => 'Settle now';
  String get tRemind => 'Remind me later';
  String get tSupport => 'Dad\'s support circle';
  String get tLoc => 'Elderly Centre/ Activity Centre';
  String get tMs => 'Ms.Chan （Person in-charge）';
  String get tSave => 'Contact Elderly immediately to ensure safety';
  String get tCallIme => 'Call immediately';
  String get tWakeupTime => '[Usual: Wake-up time is 6:30AM-7:30AM]';
  String get tNotWakeup => '11 Aug 10:00AM Dad has not get up';
  String get tSlpPtn => 'Sleeping Pattern';
  String get tNocturia => 'Nocturia';
  String get tPastRV =>
      '[Average Number of Restroom Visits at Night over the Past Week: 0.9 times]';
  String get tPresentRV =>
      'This Week Number of Restroom Visits increase to 2.34 times';
  String get tToiletingHabit => 'Toileting habit';
  String get tCheckAllActivities => 'Check All Activities';
}

// Path: profileScreen
class _StringsProfileScreenEn {
  _StringsProfileScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tProfile => 'Profile';
  String get tEditProfile => 'Edit Profile';
  String get tMenu1 => 'Settings';
  String get tMenu4 => 'Information';
  String get tMenu2 => 'Billing Details';
  String get tMenu3 => 'User Management';
  String get tlogout => 'Logout';
  String get tlogoutDiag => 'Do you want to continue to logout?';
  String get tYes => 'Yes';
  String get tNo => 'No';
}

// Path: tGlobal
class _StringsTGlobalEn {
  _StringsTGlobalEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tNo => 'NO';
  String get tYes => 'YES';
  String get tCancel => 'Cancel';
  String get tNext => 'Next';
  String get tLogin => 'Login';
  String get tEmail => 'Email';
  String get tSignup => 'Sign Up';
  String get tLogout => 'Log Out';
  String get tDelete => 'Delete';
  String get tPhoneNo => 'Phone No';
  String get tPassword => 'Password';
  String get tRepeatPW => 'Repeat Password';
  String get tFullName => 'Full Name';
  String get tOlderCode => 'Elder Code';
  String get tForgetPassword => 'Forget Password';
  String get tSignInWithGoogle => 'Sign In with Google';
  String get tConfirmSignUp => 'Confirm Sign Up';
}

// Path: noticeControl
class _StringsNoticeControlEn {
  _StringsNoticeControlEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tBreakfast => 'No Breakfast';
  String get tLunch => 'No Lunch';
  String get tLunchNo => 'Notify me between 2:00PM to 3:00PM';
  String get tDinner => 'No Dinner';
  String get tDinnerNo => 'Notify me between 10:00PM to 11:00PM';
  String get tOther => 'Other meal times';
  String get tNotgetup => 'Not get up at 10:00AM';
  String get tNotgoBed => 'Not go to bed after 00:00AM';
  String get tNotify => 'Notify me between 00:00AM to 01:00AM';
  String get tVisitToiletTime =>
      'Visit Toilet more than 10 times during daytime';
  String get tNotifyT => 'Notify me between 10:00PM to 11:00PM';
  String get tOverstay => 'Overstay in Bathroom';
  String get tNotifyI => 'Notify me between 10:00AM to 11:00AM';
  String get tDoor => 'Excessive Door Opening Hours';
  String get tQuan =>
      'Average Activity Level This Week is 50% Lower Than the Past Week';
  String get tStep => 'Number of Daily Steps';
  String get tMeals => 'Meals';
  String get tSleeping => 'Sleeping';
  String get tGoToRestroom => 'Restroom';
  String get tDoorOpen => 'Door Open';
  String get tActiveTime => 'Active Time';
}

// Path: circleOfSupportScreen
class _StringsCircleOfSupportScreenEn {
  _StringsCircleOfSupportScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tCoSScreenTitle => 'Circle of Support';
  String get tCoSLeader => 'Leader';
  String get tMember => 'Member';
  String get tCoSMember => 'Members';
  String get tAddMember => 'Add members';
  String get tManage => 'Manage';
  String get tLeaveCos => 'Leave Circle of Support';
  String get tLeaveCoSHint =>
      'If you are no longer a member of Dad\'s support circle, you may leave at any time.';
}

// Path: activityReport
class _StringsActivityReportEn {
  _StringsActivityReportEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tActivityReportTitle => 'Dad\'s Activity Analysis';
  String get tNormal => 'Normal';
  String get tAbnormal => 'Abnormal';
  String get tResult => 'Data Analysis Results';
  String get tBefore => ' (Before)';
  String get tAfter => ' (After)';
  String get tNormalDescription => 'No activity during sleep';
  String get tAbnormalDescription => 'Abnormal activity at night';
}

// Path: chatListPage
class _StringsChatListPageEn {
  _StringsChatListPageEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tTitle => 'Nurse';
}

// Path: reportWidget
class _StringsReportWidgetEn {
  _StringsReportWidgetEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tLifestyle => 'Lifestyle';
  String get tWeekly => 'Weekly Report';
  String get tMonthly => 'Monthly Report';
  String get tYearly => 'Yearly Report';
  String get tMeal => 'Meals Time';
  String get tFreq => 'Frequency: ';
  String get tBF => 'Breakfast: ';
  String get tLunch => 'Lunch: ';
  String get tDinner => 'Dinner: ';
  String get tSlp => 'Sleeping';
  String get tGetup => 'Get up: ';
  String get tBed => 'Bedtime: ';
  String get tAvg => 'Average Hours: ';
  String get tBodyMove => 'Body movements： mid-low';
  String get tNight => 'Nighttime get up：';
}

// Path: Settings
class _StringsSettingsEn {
  _StringsSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  List<String> get tLang => [
        'English',
        '中文(繁體)',
        '中文(简体)',
      ];
  String get tLangText => 'Language: ';
  String get tSettings => 'Settings';
  String get tSave => 'Save Changes?';
  String get tSaveDes => 'Do you want to save your selection?';
}

// Path: Question
class _StringsQuestionEn {
  _StringsQuestionEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tQuestionnaire => 'Questionnaire: ';
  List<String> get tQuestionType => [
        'Nocturia',
      ];
  String get tButtonText => 'Contact Elderly';
  String get tContacted => 'Elderly has been contacted!';
  String get tAskFill => 'Please fill in the questionnaire now';
  String get tEmpty => 'You have unfilled question';
  String get tDone => 'Questionnaire completed!';
  String get tNotNow => 'Not now';
  String get tContact => 'Contact';
  String get tIfNurse => 'Do you need nurse consultation now?';
  String get tQuestion1 => 'How often does the elderly urinate at night?';
  String get tQuestion2 => 'What is the color of the urine?';
  String get tQuestion3 => 'How much does the elderly urinate every time?';
  String get tQuestion4 =>
      'How much water/drinks did the elderly drink 2 hrs before going to bed?';
  String get tQuestion5 =>
      'Did the elderly eat stimulating food or drink(including coffee, tea, wine, etc.) the day before nocturia?';
  List<String> get tAnswer1 => [
        '1 time',
        '2 times',
        '3 times',
        'more than 3 times',
      ];
  List<String> get tAnswer2 => [
        'transparent',
        'light yellow',
        'yellow',
        'dark yellow',
        'bloody',
        'foamy',
      ];
  List<String> get tAnswer3 => [
        'more than daytime',
        'similar to daytime',
        'less than daytime',
      ];
  List<String> get tAnswer4 => [
        '<200 mL',
        '200-400 mL',
        '>400 mL',
      ];
  List<String> get tAnswer5 => [
        'Yes',
        'No',
        'have no idea',
      ];
}

// Path: Notification
class _StringsNotificationEn {
  _StringsNotificationEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tRule => 'Rule';
  String get tIf => 'If dad\'s actions';
  String get tDetact => 'Detected presence in';
  String get tSelect => 'Select Area';
  String get tIn => 'Between';
  String get tAnd => 'and';
  String get tBet => '';
  String get tNotice => 'Notify me after the specified time.';
  String get tDone => 'Done';
  String get tReset => 'Reset';
}

// Path: Chat
class _StringsChatEn {
  _StringsChatEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tCircleofSupport => 'Mr. Wu\'s Circle of Support';
  String get tNurse => 'Nurse';
  String get tEnter => 'Enter Message';
}

// Path: mainScreen.iconText
class _StringsMainScreenIconTextEn {
  _StringsMainScreenIconTextEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tDashBoardTitle => 'Dad\'s Health Overview';
  String get tMessageButton => 'Message';
  String get tCircleofSupport => 'Circle of Support';
  String get tNotice => 'Notification';
  String get tCall => 'Call';
  String get tActivityClockTitle => 'Activity Clock';
  String get tCheckActivityReport => 'Check Activity Analysis';
}

// Path: mainScreen.warning
class _StringsMainScreenWarningEn {
  _StringsMainScreenWarningEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tAlert => 'Latest Emergency Alert';
  String get tCheckAlert => 'Check all alerts';
  String get tNotWakeup => 'Dad has not get up!';
  String get tNotWakeupwithDate => '11 August 10:00AM Dad has not get up';
}

// Path: mainScreen.healthBlock
class _StringsMainScreenHealthBlockEn {
  _StringsMainScreenHealthBlockEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tHealthBlockTitle => 'Today\'s Health Index';
  String get tHeartRate => 'HR';
  String get tBloodOxygen => 'SPO2';
  String get tBloodPressure => 'BP';
  String get tBodyTemp => 'Temp';
  String get tBloodSugar => 'H\'stix';
  String get tHealthTitle => 'Health Details';
}

// Path: <root>
class _StringsZhCn implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsZhCn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.zhCn,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <zh-CN>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsZhCn _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsMainScreenZhCn mainScreen =
      _StringsMainScreenZhCn._(_root);
  @override
  late final _StringsWarningScreenZhCn warningScreen =
      _StringsWarningScreenZhCn._(_root);
  @override
  late final _StringsProfileScreenZhCn profileScreen =
      _StringsProfileScreenZhCn._(_root);
  @override
  late final _StringsTGlobalZhCn tGlobal = _StringsTGlobalZhCn._(_root);
  @override
  late final _StringsNoticeControlZhCn noticeControl =
      _StringsNoticeControlZhCn._(_root);
  @override
  late final _StringsCircleOfSupportScreenZhCn circleOfSupportScreen =
      _StringsCircleOfSupportScreenZhCn._(_root);
  @override
  late final _StringsActivityReportZhCn activityReport =
      _StringsActivityReportZhCn._(_root);
  @override
  late final _StringsChatListPageZhCn chatListPage =
      _StringsChatListPageZhCn._(_root);
  @override
  late final _StringsReportWidgetZhCn reportWidget =
      _StringsReportWidgetZhCn._(_root);
  @override
  late final _StringsSettingsZhCn Settings = _StringsSettingsZhCn._(_root);
  @override
  late final _StringsQuestionZhCn Question = _StringsQuestionZhCn._(_root);
  @override
  late final _StringsNotificationZhCn Notification =
      _StringsNotificationZhCn._(_root);
  @override
  late final _StringsChatZhCn Chat = _StringsChatZhCn._(_root);
  @override
  Map<String, String> get locales => {
        'en_US': 'English',
        'zh_HK': '中文(繁體)',
        'zh_CN': '中文(简体)',
      };
}

// Path: mainScreen
class _StringsMainScreenZhCn implements _StringsMainScreenEn {
  _StringsMainScreenZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '爸爸的健康概览';
  @override
  late final _StringsMainScreenIconTextZhCn iconText =
      _StringsMainScreenIconTextZhCn._(_root);
  @override
  String get tapMe => 'Tap me';
  @override
  List<String> get tRooms => [
        '------',
        '卧室',
        '浴室',
        '厨房',
      ];
  @override
  List<String> get tCNRooms => [
        '------',
        '卧室',
        '浴室',
        '厨房',
      ];
  @override
  late final _StringsMainScreenWarningZhCn warning =
      _StringsMainScreenWarningZhCn._(_root);
  @override
  late final _StringsMainScreenHealthBlockZhCn healthBlock =
      _StringsMainScreenHealthBlockZhCn._(_root);
}

// Path: warningScreen
class _StringsWarningScreenZhCn implements _StringsWarningScreenEn {
  _StringsWarningScreenZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tWarningTitle => '健康警告信号';
  @override
  String get tFormTitle => '辅助问卷';
  @override
  String get tNormalText => '正常';
  @override
  String get tAbnormalText => '异常';
  @override
  String get tWarningText => '警告';
  @override
  String get tContactElderly => '联络长者';
  @override
  String get tSettleNow => '立即处理';
  @override
  String get tRemind => '稍后处理';
  @override
  String get tSupport => '爸爸的支援圈成员';
  @override
  String get tLoc => '长者邻舍/活动中心的职员';
  @override
  String get tMs => '陈姑娘 （负责职员）';
  @override
  String get tSave => '请立即联络爸爸，确保安全';
  @override
  String get tCallIme => '立即通话';
  @override
  String get tWakeupTime => '[正常范围:起床时间为6:30AM-7:30AM]';
  @override
  String get tNotWakeup => '8 月 11 日 10:00AM 爸爸仍未起床';
  @override
  String get tSlpPtn => '睡眠习惯';
  @override
  String get tNocturia => '夜尿频繁情况';
  @override
  String get tPastRV => '[过去一星期的平均如厕次数为 2.34次]';
  @override
  String get tPresentRV => '8 月 9 日 2:00AM 爸爸的如厕次数增加了5%';
  @override
  String get tToiletingHabit => '如厕习惯';
  @override
  String get tCheckAllActivities => '查看所有活动';
}

// Path: profileScreen
class _StringsProfileScreenZhCn implements _StringsProfileScreenEn {
  _StringsProfileScreenZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tProfile => '个人资料';
  @override
  String get tEditProfile => '编辑个人资料';
  @override
  String get tMenu1 => '设定';
  @override
  String get tMenu4 => '信息';
  @override
  String get tMenu2 => '账单详情';
  @override
  String get tMenu3 => '用户管理';
  @override
  String get tlogout => '注销';
  @override
  String get tlogoutDiag => '你是否想继续注销？';
  @override
  String get tYes => '是';
  @override
  String get tNo => '否';
}

// Path: tGlobal
class _StringsTGlobalZhCn implements _StringsTGlobalEn {
  _StringsTGlobalZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tNo => '否';
  @override
  String get tYes => '是';
  @override
  String get tCancel => '取消';
  @override
  String get tNext => '下一步';
  @override
  String get tLogin => '登入';
  @override
  String get tEmail => '电子邮件';
  @override
  String get tSignup => '注册';
  @override
  String get tLogout => '注销';
  @override
  String get tDelete => '删除';
  @override
  String get tPhoneNo => '电话号码';
  @override
  String get tPassword => '密码';
  @override
  String get tRepeatPW => '重复密码';
  @override
  String get tFullName => '全名';
  @override
  String get tOlderCode => '长者代码';
  @override
  String get tForgetPassword => '忘记密码';
  @override
  String get tSignInWithGoogle => '使用 Google 登入';
  @override
  String get tConfirmSignUp => '确认注册';
}

// Path: noticeControl
class _StringsNoticeControlZhCn implements _StringsNoticeControlEn {
  _StringsNoticeControlZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tBreakfast => '早餐';
  @override
  String get tLunch => '午餐';
  @override
  String get tLunchNo => '下午2:00至下午3:00之间通知我';
  @override
  String get tDinner => '晚餐';
  @override
  String get tDinnerNo => '下午10:00至下午11:00之间通知我';
  @override
  String get tOther => '其他用餐时间';
  @override
  String get tNotgetup => '早上10时仍未起床';
  @override
  String get tNotgoBed => '晚上12时后仍未入睡';
  @override
  String get tNotify => '在午夜00:00至01:00之间通知我';
  @override
  String get tVisitToiletTime => '白天上厕所超过10次';
  @override
  String get tNotifyT => '在晚上10:00至11:00之间通知我';
  @override
  String get tOverstay => '在浴室逗留时间过长';
  @override
  String get tNotifyI => '在上午10:00至11:00之间通知我';
  @override
  String get tDoor => '开门时间过长';
  @override
  String get tQuan => '本星期平均活动量低于过去一星期50%';
  @override
  String get tStep => '每日步伐次数';
  @override
  String get tMeals => '饮食';
  @override
  String get tSleeping => '睡眠';
  @override
  String get tGoToRestroom => '如厕';
  @override
  String get tDoorOpen => '门开';
  @override
  String get tActiveTime => '活动量';
}

// Path: circleOfSupportScreen
class _StringsCircleOfSupportScreenZhCn
    implements _StringsCircleOfSupportScreenEn {
  _StringsCircleOfSupportScreenZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tCoSScreenTitle => '爸爸的支援团';
  @override
  String get tCoSLeader => '支持团队长';
  @override
  String get tMember => '成员';
  @override
  String get tCoSMember => '支援团成员';
  @override
  String get tAddMember => '添加成员';
  @override
  String get tManage => '管理';
  @override
  String get tLeaveCos => '离开支援团';
  @override
  String get tLeaveCoSHint => '如果您不再是爸爸的支持团成员，您可随时离开';
}

// Path: activityReport
class _StringsActivityReportZhCn implements _StringsActivityReportEn {
  _StringsActivityReportZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tActivityReportTitle => '爸爸的活动分析';
  @override
  String get tNormal => '正常活动';
  @override
  String get tAbnormal => '异常活动';
  @override
  String get tResult => '数据分析结果';
  @override
  String get tBefore => ' (前)';
  @override
  String get tAfter => ' (后)';
  @override
  String get tNormalDescription => '在睡觉期间并无活动';
  @override
  String get tAbnormalDescription => '在夜间有异常活动';
}

// Path: chatListPage
class _StringsChatListPageZhCn implements _StringsChatListPageEn {
  _StringsChatListPageZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tTitle => '护士';
}

// Path: reportWidget
class _StringsReportWidgetZhCn implements _StringsReportWidgetEn {
  _StringsReportWidgetZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tLifestyle => '生活习惯模式';
  @override
  String get tWeekly => '长者七日生活状况';
  @override
  String get tMonthly => '长者一个月生活状况';
  @override
  String get tYearly => '长者一年生活状况';
  @override
  String get tMeal => '用餐时间';
  @override
  String get tFreq => '用膳频率：';
  @override
  String get tBF => '早餐：';
  @override
  String get tLunch => '午餐：';
  @override
  String get tDinner => '晚餐：';
  @override
  String get tSlp => '睡眠习惯及质量';
  @override
  String get tGetup => '起床：';
  @override
  String get tBed => '就寝时间：';
  @override
  String get tAvg => '平均睡眠时数：';
  @override
  String get tBodyMove => '身体动作：中低程度';
  @override
  String get tNight => '夜间起床：';
}

// Path: Settings
class _StringsSettingsZhCn implements _StringsSettingsEn {
  _StringsSettingsZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  List<String> get tLang => [
        'English',
        '中文(繁體)',
        '中文(简体)',
      ];
  @override
  String get tLangText => '语言:';
  @override
  String get tSettings => '设置';
  @override
  String get tSave => '储存此改变？';
  @override
  String get tSaveDes => '想要储存你的选择？';
}

// Path: Question
class _StringsQuestionZhCn implements _StringsQuestionEn {
  _StringsQuestionZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tQuestionnaire => '问卷：';
  @override
  List<String> get tQuestionType => [
        '夜尿频繁',
      ];
  @override
  String get tButtonText => '联络长者';
  @override
  String get tContacted => '已联络长者！';
  @override
  String get tAskFill => '请您现在填写问卷';
  @override
  String get tEmpty => '你还有问题未填写';
  @override
  String get tDone => '问卷已填写！';
  @override
  String get tNotNow => '暂时不要';
  @override
  String get tContact => '联络长者';
  @override
  String get tIfNurse => '请问您需要护士咨询服务吗？';
  @override
  String get tQuestion1 => '长者的夜尿次数是多少？';
  @override
  String get tQuestion2 => '长者夜尿的颜色是甚么？';
  @override
  String get tQuestion3 => '长者夜尿每次的量是多少？';
  @override
  String get tQuestion4 => '长者在睡前2小时喝了多少水/饮料？';
  @override
  String get tQuestion5 => '长者在夜尿前的一天有否进食刺激性食物或饮料 (包括咖啡、茶、酒等)？';
  @override
  List<String> get tAnswer1 => [
        '1次',
        '2次',
        '3次',
        '3次以上',
      ];
  @override
  List<String> get tAnswer2 => [
        '透明',
        '淡黄',
        '黄色',
        '深黄',
        '含血',
        '多泡',
      ];
  @override
  List<String> get tAnswer3 => [
        '比日间多',
        '与日间相若',
        '比日间少',
      ];
  @override
  List<String> get tAnswer4 => [
        '<200mL',
        '200-400 ML',
        '>400ML',
      ];
  @override
  List<String> get tAnswer5 => [
        '有',
        '无',
        '不知道',
      ];
}

// Path: Notification
class _StringsNotificationZhCn implements _StringsNotificationEn {
  _StringsNotificationZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tRule => '规则名称';
  @override
  String get tIf => '如果爸爸的动作';
  @override
  String get tDetact => '检测到在';
  @override
  String get tSelect => '选择场所';
  @override
  String get tIn => '在';
  @override
  String get tAnd => '和';
  @override
  String get tBet => '之间';
  @override
  String get tNotice => '在指定时间后给我发通知';
  @override
  String get tDone => '完成';
  @override
  String get tReset => '重置';
}

// Path: Chat
class _StringsChatZhCn implements _StringsChatEn {
  _StringsChatZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tCircleofSupport => '吴爷爷的支援圈';
  @override
  String get tNurse => '护士';
  @override
  String get tEnter => '输入信息';
}

// Path: mainScreen.iconText
class _StringsMainScreenIconTextZhCn implements _StringsMainScreenIconTextEn {
  _StringsMainScreenIconTextZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tDashBoardTitle => 'Dad\'s Health Overview';
  @override
  String get tMessageButton => '信息';
  @override
  String get tCircleofSupport => '支援圈';
  @override
  String get tNotice => '通知';
  @override
  String get tCall => '通话';
  @override
  String get tActivityClockTitle => '居家活动时间表';
  @override
  String get tCheckActivityReport => '查看生活方式变化表';
}

// Path: mainScreen.warning
class _StringsMainScreenWarningZhCn implements _StringsMainScreenWarningEn {
  _StringsMainScreenWarningZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tAlert => '最新紧急警报';
  @override
  String get tCheckAlert => '查看所有警报';
  @override
  String get tNotWakeup => '爸爸仍未起床！';
  @override
  String get tNotWakeupwithDate => '8月11日 10:00AM 爸爸仍未起床';
  @override
  String get tWarningTitle => '健康警告信号';
  @override
  String get tFormTitle => '辅助问卷';
  @override
  String get tNormalText => '正常';
  @override
  String get tAbnormalText => '异常';
  @override
  String get tWarningText => '警告';
}

// Path: mainScreen.healthBlock
class _StringsMainScreenHealthBlockZhCn
    implements _StringsMainScreenHealthBlockEn {
  _StringsMainScreenHealthBlockZhCn._(this._root);

  @override
  final _StringsZhCn _root; // ignore: unused_field

  // Translations
  @override
  String get tHealthBlockTitle => '今日维生指数';
  @override
  String get tHeartRate => '心率';
  @override
  String get tBloodOxygen => '血氧含量';
  @override
  String get tBloodPressure => '血压';
  @override
  String get tBodyTemp => '身体温度';
  @override
  String get tBloodSugar => '血糖水平';
  @override
  String get tHealthTitle => '健康详情';
}

// Path: <root>
class _StringsZhHk implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsZhHk.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.zhHk,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <zh-HK>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsZhHk _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsMainScreenZhHk mainScreen =
      _StringsMainScreenZhHk._(_root);
  @override
  late final _StringsWarningScreenZhHk warningScreen =
      _StringsWarningScreenZhHk._(_root);
  @override
  late final _StringsProfileScreenZhHk profileScreen =
      _StringsProfileScreenZhHk._(_root);
  @override
  late final _StringsTGlobalZhHk tGlobal = _StringsTGlobalZhHk._(_root);
  @override
  late final _StringsNoticeControlZhHk noticeControl =
      _StringsNoticeControlZhHk._(_root);
  @override
  late final _StringsCircleOfSupportScreenZhHk circleOfSupportScreen =
      _StringsCircleOfSupportScreenZhHk._(_root);
  @override
  late final _StringsActivityReportZhHk activityReport =
      _StringsActivityReportZhHk._(_root);
  @override
  late final _StringsChatListPageZhHk chatListPage =
      _StringsChatListPageZhHk._(_root);
  @override
  late final _StringsReportWidgetZhHk reportWidget =
      _StringsReportWidgetZhHk._(_root);
  @override
  late final _StringsSettingsZhHk Settings = _StringsSettingsZhHk._(_root);
  @override
  late final _StringsQuestionZhHk Question = _StringsQuestionZhHk._(_root);
  @override
  late final _StringsNotificationZhHk Notification =
      _StringsNotificationZhHk._(_root);
  @override
  late final _StringsChatZhHk Chat = _StringsChatZhHk._(_root);
  @override
  Map<String, String> get locales => {
        'en_US': 'English',
        'zh_HK': '中文(繁體)',
        'zh_CN': '中文(简体)',
      };
}

// Path: mainScreen
class _StringsMainScreenZhHk implements _StringsMainScreenEn {
  _StringsMainScreenZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get title => '爸爸的健康概覽';
  @override
  late final _StringsMainScreenIconTextZhHk iconText =
      _StringsMainScreenIconTextZhHk._(_root);
  @override
  String get tapMe => 'Tap me';
  @override
  List<String> get tRooms => [
        '------',
        '臥室',
        '浴室',
        '厨房',
      ];
  @override
  List<String> get tCNRooms => [
        '------',
        '臥室',
        '浴室',
        '厨房',
      ];
  @override
  late final _StringsMainScreenWarningZhHk warning =
      _StringsMainScreenWarningZhHk._(_root);
  @override
  late final _StringsMainScreenHealthBlockZhHk healthBlock =
      _StringsMainScreenHealthBlockZhHk._(_root);
}

// Path: warningScreen
class _StringsWarningScreenZhHk implements _StringsWarningScreenEn {
  _StringsWarningScreenZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tWarningTitle => '健康警告信號';
  @override
  String get tFormTitle => '輔助問卷';
  @override
  String get tNormalText => '正常';
  @override
  String get tAbnormalText => '異常';
  @override
  String get tWarningText => '警告';
  @override
  String get tContactElderly => '聯絡長者';
  @override
  String get tSettleNow => '立即處理';
  @override
  String get tRemind => '稍後處理';
  @override
  String get tSupport => '爸爸的支援圈成員';
  @override
  String get tLoc => '長者鄰舍/活動中心的職員';
  @override
  String get tMs => '陳姑娘 （負責職員）';
  @override
  String get tSave => '請立即聯絡爸爸，確保安全';
  @override
  String get tCallIme => '立即通話';
  @override
  String get tWakeupTime => '[正常範圍:起床時間為6:30AM-7:30AM]';
  @override
  String get tNotWakeup => '8 月 11 日 10:00AM 爸爸仍未起床';
  @override
  String get tSlpPtn => '睡眠習慣';
  @override
  String get tNocturia => '夜尿頻繁情況';
  @override
  String get tPastRV => '[過去一星期的平均如廁次數為 2.34次]';
  @override
  String get tPresentRV => '8 月 9 日 2:00AM 爸爸的如廁次數增加了5%';
  @override
  String get tToiletingHabit => '如厠習慣';
  @override
  String get tCheckAllActivities => '查看所有活動';
}

// Path: profileScreen
class _StringsProfileScreenZhHk implements _StringsProfileScreenEn {
  _StringsProfileScreenZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tProfile => '個人資料';
  @override
  String get tEditProfile => '編輯個人資料';
  @override
  String get tMenu1 => '設定';
  @override
  String get tMenu4 => '資訊';
  @override
  String get tMenu2 => '賬單詳情';
  @override
  String get tMenu3 => '用戶管理';
  @override
  String get tlogout => '登出';
  @override
  String get tlogoutDiag => '你是否想繼續登出？';
  @override
  String get tYes => '是';
  @override
  String get tNo => '否';
}

// Path: tGlobal
class _StringsTGlobalZhHk implements _StringsTGlobalEn {
  _StringsTGlobalZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tNo => '否';
  @override
  String get tYes => '是';
  @override
  String get tCancel => '取消';
  @override
  String get tNext => '下一步';
  @override
  String get tLogin => '登入';
  @override
  String get tEmail => '電子郵件';
  @override
  String get tSignup => '註冊';
  @override
  String get tLogout => '登出';
  @override
  String get tDelete => '刪除';
  @override
  String get tPhoneNo => '電話號碼';
  @override
  String get tPassword => '密碼';
  @override
  String get tRepeatPW => '重複密碼';
  @override
  String get tFullName => '全名';
  @override
  String get tOlderCode => '長者代碼';
  @override
  String get tForgetPassword => '忘記密碼';
  @override
  String get tSignInWithGoogle => '使用 Google 登入';
  @override
  String get tConfirmSignUp => '確認註冊';
}

// Path: noticeControl
class _StringsNoticeControlZhHk implements _StringsNoticeControlEn {
  _StringsNoticeControlZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tBreakfast => '早餐';
  @override
  String get tLunch => '午餐';
  @override
  String get tLunchNo => '下午2:00至下午3:00之間通知我';
  @override
  String get tDinner => '晚餐';
  @override
  String get tDinnerNo => '下午10:00至下午11:00之間通知我';
  @override
  String get tOther => '其他用餐時間';
  @override
  String get tNotgetup => '早上10時仍未起床';
  @override
  String get tNotgoBed => '晚上12時後仍未入睡';
  @override
  String get tNotify => '在午夜00:00至01:00之間通知我';
  @override
  String get tVisitToiletTime => '白天上廁所超過10次';
  @override
  String get tNotifyT => '在晚上10:00至11:00之間通知我';
  @override
  String get tOverstay => '在浴室逗留時間過長';
  @override
  String get tNotifyI => '在上午10:00至11:00之間通知我';
  @override
  String get tDoor => '開門時間過長';
  @override
  String get tQuan => '本星期平均活動量低於過去一星期50%';
  @override
  String get tStep => '每日步伐次數';
  @override
  String get tMeals => '飲食';
  @override
  String get tSleeping => '睡眠';
  @override
  String get tGoToRestroom => '如厠';
  @override
  String get tDoorOpen => '門開';
  @override
  String get tActiveTime => '活動量';
}

// Path: circleOfSupportScreen
class _StringsCircleOfSupportScreenZhHk
    implements _StringsCircleOfSupportScreenEn {
  _StringsCircleOfSupportScreenZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tCoSScreenTitle => '爸爸的支援團';
  @override
  String get tCoSLeader => '支援團隊長';
  @override
  String get tMember => '成員';
  @override
  String get tCoSMember => '支援團成員';
  @override
  String get tAddMember => '添加成員';
  @override
  String get tManage => '管理';
  @override
  String get tLeaveCos => '離開支援團';
  @override
  String get tLeaveCoSHint => '如果您不再是爸爸的支援團成員，您可隨時離開';
}

// Path: activityReport
class _StringsActivityReportZhHk implements _StringsActivityReportEn {
  _StringsActivityReportZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tActivityReportTitle => '爸爸的活動分析';
  @override
  String get tNormal => '正常活動';
  @override
  String get tAbnormal => '異常活動';
  @override
  String get tResult => '數據分析結果';
  @override
  String get tBefore => ' (前)';
  @override
  String get tAfter => ' (後)';
  @override
  String get tNormalDescription => '在睡覺期間並無活動';
  @override
  String get tAbnormalDescription => '在夜間有異常活動';
}

// Path: chatListPage
class _StringsChatListPageZhHk implements _StringsChatListPageEn {
  _StringsChatListPageZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tTitle => '護士';
}

// Path: reportWidget
class _StringsReportWidgetZhHk implements _StringsReportWidgetEn {
  _StringsReportWidgetZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tLifestyle => '生活習慣模式';
  @override
  String get tWeekly => '長者七日生活狀況';
  @override
  String get tMonthly => '長者一個月生活狀況';
  @override
  String get tYearly => '長者一年生活狀況';
  @override
  String get tMeal => '用餐時間';
  @override
  String get tFreq => '用膳頻率：';
  @override
  String get tBF => '早餐：';
  @override
  String get tLunch => '午餐：';
  @override
  String get tDinner => '晚餐：';
  @override
  String get tSlp => '睡眠習慣及質量';
  @override
  String get tGetup => '起床：';
  @override
  String get tBed => '就寢時間：';
  @override
  String get tAvg => '平均睡眠時數：';
  @override
  String get tBodyMove => '身體動作：中低程度';
  @override
  String get tNight => '夜間起床：';
}

// Path: Settings
class _StringsSettingsZhHk implements _StringsSettingsEn {
  _StringsSettingsZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  List<String> get tLang => [
        'English',
        '中文(繁體)',
        '中文(简体)',
      ];
  @override
  String get tLangText => '語言:';
  @override
  String get tSettings => '設置';
  @override
  String get tSave => '儲存此改變？';
  @override
  String get tSaveDes => '想要儲存你的選擇？';
}

// Path: Question
class _StringsQuestionZhHk implements _StringsQuestionEn {
  _StringsQuestionZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tQuestionnaire => '問卷：';
  @override
  List<String> get tQuestionType => [
        '夜尿頻繁',
      ];
  @override
  String get tButtonText => '聯絡長者';
  @override
  String get tContacted => '已聯絡長者！';
  @override
  String get tAskFill => '請您現在填寫問卷';
  @override
  String get tEmpty => '你還有問題未填寫';
  @override
  String get tDone => '問卷已填寫！';
  @override
  String get tNotNow => '暫時不要';
  @override
  String get tContact => '聯絡長者';
  @override
  String get tIfNurse => '請問您需要護士諮詢服務嗎？';
  @override
  String get tQuestion1 => '長者的夜尿次數是多少？';
  @override
  String get tQuestion2 => '長者夜尿的顏色是甚麼？';
  @override
  String get tQuestion3 => '長者夜尿每次的量是多少？';
  @override
  String get tQuestion4 => '長者在睡前2小時喝了多少水/飲料？';
  @override
  String get tQuestion5 => '長者在夜尿前的一天有否進食刺激性食物或飲料 (包括咖啡、茶、酒等)？';
  @override
  List<String> get tAnswer1 => [
        '1次',
        '2次',
        '3次',
        '3次以上',
      ];
  @override
  List<String> get tAnswer2 => [
        '透明',
        '淡黃',
        '黃色',
        '深黃',
        '含血',
        '多泡',
      ];
  @override
  List<String> get tAnswer3 => [
        '比日間多',
        '與日間相若',
        '比日間少',
      ];
  @override
  List<String> get tAnswer4 => [
        '<200mL',
        '200-400 ML',
        '>400ML',
      ];
  @override
  List<String> get tAnswer5 => [
        '有',
        '無',
        '不知道',
      ];
}

// Path: Notification
class _StringsNotificationZhHk implements _StringsNotificationEn {
  _StringsNotificationZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tRule => '規則名稱';
  @override
  String get tIf => '如果爸爸的動作';
  @override
  String get tDetact => '檢測到在';
  @override
  String get tSelect => '選擇場所';
  @override
  String get tIn => '在';
  @override
  String get tAnd => '和';
  @override
  String get tBet => '之間';
  @override
  String get tNotice => '在指定時間後給我發通知';
  @override
  String get tDone => '完成';
  @override
  String get tReset => '重置';
}

// Path: Chat
class _StringsChatZhHk implements _StringsChatEn {
  _StringsChatZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tCircleofSupport => '吳伯伯的支援圈';
  @override
  String get tNurse => '護士';
  @override
  String get tEnter => '輸入訊息';
}

// Path: mainScreen.iconText
class _StringsMainScreenIconTextZhHk implements _StringsMainScreenIconTextEn {
  _StringsMainScreenIconTextZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tDashBoardTitle => 'Dad\'s Health Overview';
  @override
  String get tMessageButton => '信息';
  @override
  String get tCircleofSupport => '支援圈';
  @override
  String get tNotice => '通知';
  @override
  String get tCall => '通話';
  @override
  String get tActivityClockTitle => '居家活動時間表';
  @override
  String get tCheckActivityReport => '查看生活方式變化表';
}

// Path: mainScreen.warning
class _StringsMainScreenWarningZhHk implements _StringsMainScreenWarningEn {
  _StringsMainScreenWarningZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tAlert => '最新緊急警報';
  @override
  String get tCheckAlert => '查看所有警報';
  @override
  String get tNotWakeup => '爸爸仍未起床！';
  @override
  String get tNotWakeupwithDate => '8月11日 10:00AM 爸爸仍未起床';
  @override
  String get tWarningTitle => '健康警告信號';
  @override
  String get tFormTitle => '輔助問卷';
  @override
  String get tNormalText => '正常';
  @override
  String get tAbnormalText => '異常';
  @override
  String get tWarningText => '警告';
}

// Path: mainScreen.healthBlock
class _StringsMainScreenHealthBlockZhHk
    implements _StringsMainScreenHealthBlockEn {
  _StringsMainScreenHealthBlockZhHk._(this._root);

  @override
  final _StringsZhHk _root; // ignore: unused_field

  // Translations
  @override
  String get tHealthBlockTitle => '今日維生指數';
  @override
  String get tHeartRate => '心率';
  @override
  String get tBloodOxygen => '血氧含量';
  @override
  String get tBloodPressure => '血壓';
  @override
  String get tBodyTemp => '身體溫度';
  @override
  String get tBloodSugar => '血糖水平';
  @override
  String get tHealthTitle => '健康詳情';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'mainScreen.title':
        return 'Dad\'s Health Overview';
      case 'mainScreen.iconText.tDashBoardTitle':
        return 'Dad\'s Health Overview';
      case 'mainScreen.iconText.tMessageButton':
        return 'Message';
      case 'mainScreen.iconText.tCircleofSupport':
        return 'Circle of Support';
      case 'mainScreen.iconText.tNotice':
        return 'Notification';
      case 'mainScreen.iconText.tCall':
        return 'Call';
      case 'mainScreen.iconText.tActivityClockTitle':
        return 'Activity Clock';
      case 'mainScreen.iconText.tCheckActivityReport':
        return 'Check Activity Analysis';
      case 'mainScreen.tRooms.0':
        return '------';
      case 'mainScreen.tRooms.1':
        return 'Bedroom';
      case 'mainScreen.tRooms.2':
        return 'Bathroom';
      case 'mainScreen.tRooms.3':
        return 'Kitchen';
      case 'mainScreen.tCNRooms.0':
        return '------';
      case 'mainScreen.tCNRooms.1':
        return 'Bedroom';
      case 'mainScreen.tCNRooms.2':
        return 'Bathroom';
      case 'mainScreen.tCNRooms.3':
        return 'Kitchen';
      case 'mainScreen.tapMe':
        return 'Testing Eng';
      case 'mainScreen.warning.tAlert':
        return 'Latest Emergency Alert';
      case 'mainScreen.warning.tCheckAlert':
        return 'Check all alerts';
      case 'mainScreen.warning.tNotWakeup':
        return 'Dad has not get up!';
      case 'mainScreen.warning.tNotWakeupwithDate':
        return '11 August 10:00AM Dad has not get up';
      case 'mainScreen.healthBlock.tHealthBlockTitle':
        return 'Today\'s Health Index';
      case 'mainScreen.healthBlock.tHeartRate':
        return 'HR';
      case 'mainScreen.healthBlock.tBloodOxygen':
        return 'SPO2';
      case 'mainScreen.healthBlock.tBloodPressure':
        return 'BP';
      case 'mainScreen.healthBlock.tBodyTemp':
        return 'Temp';
      case 'mainScreen.healthBlock.tBloodSugar':
        return 'H\'stix';
      case 'mainScreen.healthBlock.tHealthTitle':
        return 'Health Details';
      case 'warningScreen.tWarningTitle':
        return 'Health Alerts';
      case 'warningScreen.tFormTitle':
        return 'Assistant Form';
      case 'warningScreen.tNormalText':
        return 'Normal';
      case 'warningScreen.tAbnormalText':
        return 'Abnormal';
      case 'warningScreen.tWarningText':
        return 'Warning';
      case 'warningScreen.tContactElderly':
        return 'Contact Elderly';
      case 'warningScreen.tSettleNow':
        return 'Settle now';
      case 'warningScreen.tRemind':
        return 'Remind me later';
      case 'warningScreen.tSupport':
        return 'Dad\'s support circle';
      case 'warningScreen.tLoc':
        return 'Elderly Centre/ Activity Centre';
      case 'warningScreen.tMs':
        return 'Ms.Chan （Person in-charge）';
      case 'warningScreen.tSave':
        return 'Contact Elderly immediately to ensure safety';
      case 'warningScreen.tCallIme':
        return 'Call immediately';
      case 'warningScreen.tWakeupTime':
        return '[Usual: Wake-up time is 6:30AM-7:30AM]';
      case 'warningScreen.tNotWakeup':
        return '11 Aug 10:00AM Dad has not get up';
      case 'warningScreen.tSlpPtn':
        return 'Sleeping Pattern';
      case 'warningScreen.tNocturia':
        return 'Nocturia';
      case 'warningScreen.tPastRV':
        return '[Average Number of Restroom Visits at Night over the Past Week: 0.9 times]';
      case 'warningScreen.tPresentRV':
        return 'This Week Number of Restroom Visits increase to 2.34 times';
      case 'warningScreen.tToiletingHabit':
        return 'Toileting habit';
      case 'warningScreen.tCheckAllActivities':
        return 'Check All Activities';
      case 'profileScreen.tProfile':
        return 'Profile';
      case 'profileScreen.tEditProfile':
        return 'Edit Profile';
      case 'profileScreen.tMenu1':
        return 'Settings';
      case 'profileScreen.tMenu4':
        return 'Information';
      case 'profileScreen.tMenu2':
        return 'Billing Details';
      case 'profileScreen.tMenu3':
        return 'User Management';
      case 'profileScreen.tlogout':
        return 'Logout';
      case 'profileScreen.tlogoutDiag':
        return 'Do you want to continue to logout?';
      case 'profileScreen.tYes':
        return 'Yes';
      case 'profileScreen.tNo':
        return 'No';
      case 'tGlobal.tNo':
        return 'NO';
      case 'tGlobal.tYes':
        return 'YES';
      case 'tGlobal.tCancel':
        return 'Cancel';
      case 'tGlobal.tNext':
        return 'Next';
      case 'tGlobal.tLogin':
        return 'Login';
      case 'tGlobal.tEmail':
        return 'Email';
      case 'tGlobal.tSignup':
        return 'Sign Up';
      case 'tGlobal.tLogout':
        return 'Log Out';
      case 'tGlobal.tDelete':
        return 'Delete';
      case 'tGlobal.tPhoneNo':
        return 'Phone No';
      case 'tGlobal.tPassword':
        return 'Password';
      case 'tGlobal.tRepeatPW':
        return 'Repeat Password';
      case 'tGlobal.tFullName':
        return 'Full Name';
      case 'tGlobal.tOlderCode':
        return 'Elder Code';
      case 'tGlobal.tForgetPassword':
        return 'Forget Password';
      case 'tGlobal.tSignInWithGoogle':
        return 'Sign In with Google';
      case 'tGlobal.tConfirmSignUp':
        return 'Confirm Sign Up';
      case 'noticeControl.tBreakfast':
        return 'No Breakfast';
      case 'noticeControl.tLunch':
        return 'No Lunch';
      case 'noticeControl.tLunchNo':
        return 'Notify me between 2:00PM to 3:00PM';
      case 'noticeControl.tDinner':
        return 'No Dinner';
      case 'noticeControl.tDinnerNo':
        return 'Notify me between 10:00PM to 11:00PM';
      case 'noticeControl.tOther':
        return 'Other meal times';
      case 'noticeControl.tNotgetup':
        return 'Not get up at 10:00AM';
      case 'noticeControl.tNotgoBed':
        return 'Not go to bed after 00:00AM';
      case 'noticeControl.tNotify':
        return 'Notify me between 00:00AM to 01:00AM';
      case 'noticeControl.tVisitToiletTime':
        return 'Visit Toilet more than 10 times during daytime';
      case 'noticeControl.tNotifyT':
        return 'Notify me between 10:00PM to 11:00PM';
      case 'noticeControl.tOverstay':
        return 'Overstay in Bathroom';
      case 'noticeControl.tNotifyI':
        return 'Notify me between 10:00AM to 11:00AM';
      case 'noticeControl.tDoor':
        return 'Excessive Door Opening Hours';
      case 'noticeControl.tQuan':
        return 'Average Activity Level This Week is 50% Lower Than the Past Week';
      case 'noticeControl.tStep':
        return 'Number of Daily Steps';
      case 'noticeControl.tMeals':
        return 'Meals';
      case 'noticeControl.tSleeping':
        return 'Sleeping';
      case 'noticeControl.tGoToRestroom':
        return 'Restroom';
      case 'noticeControl.tDoorOpen':
        return 'Door Open';
      case 'noticeControl.tActiveTime':
        return 'Active Time';
      case 'circleOfSupportScreen.tCoSScreenTitle':
        return 'Circle of Support';
      case 'circleOfSupportScreen.tCoSLeader':
        return 'Leader';
      case 'circleOfSupportScreen.tMember':
        return 'Member';
      case 'circleOfSupportScreen.tCoSMember':
        return 'Members';
      case 'circleOfSupportScreen.tAddMember':
        return 'Add members';
      case 'circleOfSupportScreen.tManage':
        return 'Manage';
      case 'circleOfSupportScreen.tLeaveCos':
        return 'Leave Circle of Support';
      case 'circleOfSupportScreen.tLeaveCoSHint':
        return 'If you are no longer a member of Dad\'s support circle, you may leave at any time.';
      case 'activityReport.tActivityReportTitle':
        return 'Dad\'s Activity Analysis';
      case 'activityReport.tNormal':
        return 'Normal';
      case 'activityReport.tAbnormal':
        return 'Abnormal';
      case 'activityReport.tResult':
        return 'Data Analysis Results';
      case 'activityReport.tBefore':
        return ' (Before)';
      case 'activityReport.tAfter':
        return ' (After)';
      case 'activityReport.tNormalDescription':
        return 'No activity during sleep';
      case 'activityReport.tAbnormalDescription':
        return 'Abnormal activity at night';
      case 'chatListPage.tTitle':
        return 'Nurse';
      case 'reportWidget.tLifestyle':
        return 'Lifestyle';
      case 'reportWidget.tWeekly':
        return 'Weekly Report';
      case 'reportWidget.tMonthly':
        return 'Monthly Report';
      case 'reportWidget.tYearly':
        return 'Yearly Report';
      case 'reportWidget.tMeal':
        return 'Meals Time';
      case 'reportWidget.tFreq':
        return 'Frequency: ';
      case 'reportWidget.tBF':
        return 'Breakfast: ';
      case 'reportWidget.tLunch':
        return 'Lunch: ';
      case 'reportWidget.tDinner':
        return 'Dinner: ';
      case 'reportWidget.tSlp':
        return 'Sleeping';
      case 'reportWidget.tGetup':
        return 'Get up: ';
      case 'reportWidget.tBed':
        return 'Bedtime: ';
      case 'reportWidget.tAvg':
        return 'Average Hours: ';
      case 'reportWidget.tBodyMove':
        return 'Body movements： mid-low';
      case 'reportWidget.tNight':
        return 'Nighttime get up：';
      case 'Settings.tLang.0':
        return 'English';
      case 'Settings.tLang.1':
        return '中文(繁體)';
      case 'Settings.tLang.2':
        return '中文(简体)';
      case 'Settings.tLangText':
        return 'Language: ';
      case 'Settings.tSettings':
        return 'Settings';
      case 'Settings.tSave':
        return 'Save Changes?';
      case 'Settings.tSaveDes':
        return 'Do you want to save your selection?';
      case 'Question.tQuestionnaire':
        return 'Questionnaire: ';
      case 'Question.tQuestionType.0':
        return 'Nocturia';
      case 'Question.tButtonText':
        return 'Contact Elderly';
      case 'Question.tContacted':
        return 'Elderly has been contacted!';
      case 'Question.tAskFill':
        return 'Please fill in the questionnaire now';
      case 'Question.tEmpty':
        return 'You have unfilled question';
      case 'Question.tDone':
        return 'Questionnaire completed!';
      case 'Question.tNotNow':
        return 'Not now';
      case 'Question.tContact':
        return 'Contact';
      case 'Question.tIfNurse':
        return 'Do you need nurse consultation now?';
      case 'Question.tQuestion1':
        return 'How often does the elderly urinate at night?';
      case 'Question.tQuestion2':
        return 'What is the color of the urine?';
      case 'Question.tQuestion3':
        return 'How much does the elderly urinate every time?';
      case 'Question.tQuestion4':
        return 'How much water/drinks did the elderly drink 2 hrs before going to bed?';
      case 'Question.tQuestion5':
        return 'Did the elderly eat stimulating food or drink(including coffee, tea, wine, etc.) the day before nocturia?';
      case 'Question.tAnswer1.0':
        return '1 time';
      case 'Question.tAnswer1.1':
        return '2 times';
      case 'Question.tAnswer1.2':
        return '3 times';
      case 'Question.tAnswer1.3':
        return 'more than 3 times';
      case 'Question.tAnswer2.0':
        return 'transparent';
      case 'Question.tAnswer2.1':
        return 'light yellow';
      case 'Question.tAnswer2.2':
        return 'yellow';
      case 'Question.tAnswer2.3':
        return 'dark yellow';
      case 'Question.tAnswer2.4':
        return 'bloody';
      case 'Question.tAnswer2.5':
        return 'foamy';
      case 'Question.tAnswer3.0':
        return 'more than daytime';
      case 'Question.tAnswer3.1':
        return 'similar to daytime';
      case 'Question.tAnswer3.2':
        return 'less than daytime';
      case 'Question.tAnswer4.0':
        return '<200 mL';
      case 'Question.tAnswer4.1':
        return '200-400 mL';
      case 'Question.tAnswer4.2':
        return '>400 mL';
      case 'Question.tAnswer5.0':
        return 'Yes';
      case 'Question.tAnswer5.1':
        return 'No';
      case 'Question.tAnswer5.2':
        return 'have no idea';
      case 'Notification.tRule':
        return 'Rule';
      case 'Notification.tIf':
        return 'If dad\'s actions';
      case 'Notification.tDetact':
        return 'Detected presence in';
      case 'Notification.tSelect':
        return 'Select Area';
      case 'Notification.tIn':
        return 'Between';
      case 'Notification.tAnd':
        return 'and';
      case 'Notification.tBet':
        return '';
      case 'Notification.tNotice':
        return 'Notify me after the specified time.';
      case 'Notification.tDone':
        return 'Done';
      case 'Notification.tReset':
        return 'Reset';
      case 'Chat.tCircleofSupport':
        return 'Mr. Wu\'s Circle of Support';
      case 'Chat.tNurse':
        return 'Nurse';
      case 'Chat.tEnter':
        return 'Enter Message';
      case 'locales.en_US':
        return 'English';
      case 'locales.zh_HK':
        return '中文(繁體)';
      case 'locales.zh_CN':
        return '中文(简体)';
      default:
        return null;
    }
  }
}

extension on _StringsZhCn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'mainScreen.title':
        return '爸爸的健康概览';
      case 'mainScreen.iconText.tDashBoardTitle':
        return 'Dad\'s Health Overview';
      case 'mainScreen.iconText.tMessageButton':
        return '信息';
      case 'mainScreen.iconText.tCircleofSupport':
        return '支援圈';
      case 'mainScreen.iconText.tNotice':
        return '通知';
      case 'mainScreen.iconText.tCall':
        return '通话';
      case 'mainScreen.iconText.tActivityClockTitle':
        return '居家活动时间表';
      case 'mainScreen.iconText.tCheckActivityReport':
        return '查看生活方式变化表';
      case 'mainScreen.tapMe':
        return 'Tap me';
      case 'mainScreen.tRooms.0':
        return '------';
      case 'mainScreen.tRooms.1':
        return '卧室';
      case 'mainScreen.tRooms.2':
        return '浴室';
      case 'mainScreen.tRooms.3':
        return '厨房';
      case 'mainScreen.tCNRooms.0':
        return '------';
      case 'mainScreen.tCNRooms.1':
        return '卧室';
      case 'mainScreen.tCNRooms.2':
        return '浴室';
      case 'mainScreen.tCNRooms.3':
        return '厨房';
      case 'mainScreen.warning.tAlert':
        return '最新紧急警报';
      case 'mainScreen.warning.tCheckAlert':
        return '查看所有警报';
      case 'mainScreen.warning.tNotWakeup':
        return '爸爸仍未起床！';
      case 'mainScreen.warning.tNotWakeupwithDate':
        return '8月11日 10:00AM 爸爸仍未起床';
      case 'mainScreen.warning.tWarningTitle':
        return '健康警告信号';
      case 'mainScreen.warning.tFormTitle':
        return '辅助问卷';
      case 'mainScreen.warning.tNormalText':
        return '正常';
      case 'mainScreen.warning.tAbnormalText':
        return '异常';
      case 'mainScreen.warning.tWarningText':
        return '警告';
      case 'mainScreen.healthBlock.tHealthBlockTitle':
        return '今日维生指数';
      case 'mainScreen.healthBlock.tHeartRate':
        return '心率';
      case 'mainScreen.healthBlock.tBloodOxygen':
        return '血氧含量';
      case 'mainScreen.healthBlock.tBloodPressure':
        return '血压';
      case 'mainScreen.healthBlock.tBodyTemp':
        return '身体温度';
      case 'mainScreen.healthBlock.tBloodSugar':
        return '血糖水平';
      case 'mainScreen.healthBlock.tHealthTitle':
        return '健康详情';
      case 'warningScreen.tWarningTitle':
        return '健康警告信号';
      case 'warningScreen.tFormTitle':
        return '辅助问卷';
      case 'warningScreen.tNormalText':
        return '正常';
      case 'warningScreen.tAbnormalText':
        return '异常';
      case 'warningScreen.tWarningText':
        return '警告';
      case 'warningScreen.tContactElderly':
        return '联络长者';
      case 'warningScreen.tSettleNow':
        return '立即处理';
      case 'warningScreen.tRemind':
        return '稍后处理';
      case 'warningScreen.tSupport':
        return '爸爸的支援圈成员';
      case 'warningScreen.tLoc':
        return '长者邻舍/活动中心的职员';
      case 'warningScreen.tMs':
        return '陈姑娘 （负责职员）';
      case 'warningScreen.tSave':
        return '请立即联络爸爸，确保安全';
      case 'warningScreen.tCallIme':
        return '立即通话';
      case 'warningScreen.tWakeupTime':
        return '[正常范围:起床时间为6:30AM-7:30AM]';
      case 'warningScreen.tNotWakeup':
        return '8 月 11 日 10:00AM 爸爸仍未起床';
      case 'warningScreen.tSlpPtn':
        return '睡眠习惯';
      case 'warningScreen.tNocturia':
        return '夜尿频繁情况';
      case 'warningScreen.tPastRV':
        return '[过去一星期的平均如厕次数为 2.34次]';
      case 'warningScreen.tPresentRV':
        return '8 月 9 日 2:00AM 爸爸的如厕次数增加了5%';
      case 'warningScreen.tToiletingHabit':
        return '如厕习惯';
      case 'warningScreen.tCheckAllActivities':
        return '查看所有活动';
      case 'profileScreen.tProfile':
        return '个人资料';
      case 'profileScreen.tEditProfile':
        return '编辑个人资料';
      case 'profileScreen.tMenu1':
        return '设定';
      case 'profileScreen.tMenu4':
        return '信息';
      case 'profileScreen.tMenu2':
        return '账单详情';
      case 'profileScreen.tMenu3':
        return '用户管理';
      case 'profileScreen.tlogout':
        return '注销';
      case 'profileScreen.tlogoutDiag':
        return '你是否想继续注销？';
      case 'profileScreen.tYes':
        return '是';
      case 'profileScreen.tNo':
        return '否';
      case 'tGlobal.tNo':
        return '否';
      case 'tGlobal.tYes':
        return '是';
      case 'tGlobal.tCancel':
        return '取消';
      case 'tGlobal.tNext':
        return '下一步';
      case 'tGlobal.tLogin':
        return '登入';
      case 'tGlobal.tEmail':
        return '电子邮件';
      case 'tGlobal.tSignup':
        return '注册';
      case 'tGlobal.tLogout':
        return '注销';
      case 'tGlobal.tDelete':
        return '删除';
      case 'tGlobal.tPhoneNo':
        return '电话号码';
      case 'tGlobal.tPassword':
        return '密码';
      case 'tGlobal.tRepeatPW':
        return '重复密码';
      case 'tGlobal.tFullName':
        return '全名';
      case 'tGlobal.tOlderCode':
        return '长者代码';
      case 'tGlobal.tForgetPassword':
        return '忘记密码';
      case 'tGlobal.tSignInWithGoogle':
        return '使用 Google 登入';
      case 'tGlobal.tConfirmSignUp':
        return '确认注册';
      case 'noticeControl.tBreakfast':
        return '早餐';
      case 'noticeControl.tLunch':
        return '午餐';
      case 'noticeControl.tLunchNo':
        return '下午2:00至下午3:00之间通知我';
      case 'noticeControl.tDinner':
        return '晚餐';
      case 'noticeControl.tDinnerNo':
        return '下午10:00至下午11:00之间通知我';
      case 'noticeControl.tOther':
        return '其他用餐时间';
      case 'noticeControl.tNotgetup':
        return '早上10时仍未起床';
      case 'noticeControl.tNotgoBed':
        return '晚上12时后仍未入睡';
      case 'noticeControl.tNotify':
        return '在午夜00:00至01:00之间通知我';
      case 'noticeControl.tVisitToiletTime':
        return '白天上厕所超过10次';
      case 'noticeControl.tNotifyT':
        return '在晚上10:00至11:00之间通知我';
      case 'noticeControl.tOverstay':
        return '在浴室逗留时间过长';
      case 'noticeControl.tNotifyI':
        return '在上午10:00至11:00之间通知我';
      case 'noticeControl.tDoor':
        return '开门时间过长';
      case 'noticeControl.tQuan':
        return '本星期平均活动量低于过去一星期50%';
      case 'noticeControl.tStep':
        return '每日步伐次数';
      case 'noticeControl.tMeals':
        return '饮食';
      case 'noticeControl.tSleeping':
        return '睡眠';
      case 'noticeControl.tGoToRestroom':
        return '如厕';
      case 'noticeControl.tDoorOpen':
        return '门开';
      case 'noticeControl.tActiveTime':
        return '活动量';
      case 'circleOfSupportScreen.tCoSScreenTitle':
        return '爸爸的支援团';
      case 'circleOfSupportScreen.tCoSLeader':
        return '支持团队长';
      case 'circleOfSupportScreen.tMember':
        return '成员';
      case 'circleOfSupportScreen.tCoSMember':
        return '支援团成员';
      case 'circleOfSupportScreen.tAddMember':
        return '添加成员';
      case 'circleOfSupportScreen.tManage':
        return '管理';
      case 'circleOfSupportScreen.tLeaveCos':
        return '离开支援团';
      case 'circleOfSupportScreen.tLeaveCoSHint':
        return '如果您不再是爸爸的支持团成员，您可随时离开';
      case 'activityReport.tActivityReportTitle':
        return '爸爸的活动分析';
      case 'activityReport.tNormal':
        return '正常活动';
      case 'activityReport.tAbnormal':
        return '异常活动';
      case 'activityReport.tResult':
        return '数据分析结果';
      case 'activityReport.tBefore':
        return ' (前)';
      case 'activityReport.tAfter':
        return ' (后)';
      case 'activityReport.tNormalDescription':
        return '在睡觉期间并无活动';
      case 'activityReport.tAbnormalDescription':
        return '在夜间有异常活动';
      case 'chatListPage.tTitle':
        return '护士';
      case 'reportWidget.tLifestyle':
        return '生活习惯模式';
      case 'reportWidget.tWeekly':
        return '长者七日生活状况';
      case 'reportWidget.tMonthly':
        return '长者一个月生活状况';
      case 'reportWidget.tYearly':
        return '长者一年生活状况';
      case 'reportWidget.tMeal':
        return '用餐时间';
      case 'reportWidget.tFreq':
        return '用膳频率：';
      case 'reportWidget.tBF':
        return '早餐：';
      case 'reportWidget.tLunch':
        return '午餐：';
      case 'reportWidget.tDinner':
        return '晚餐：';
      case 'reportWidget.tSlp':
        return '睡眠习惯及质量';
      case 'reportWidget.tGetup':
        return '起床：';
      case 'reportWidget.tBed':
        return '就寝时间：';
      case 'reportWidget.tAvg':
        return '平均睡眠时数：';
      case 'reportWidget.tBodyMove':
        return '身体动作：中低程度';
      case 'reportWidget.tNight':
        return '夜间起床：';
      case 'Settings.tLang.0':
        return 'English';
      case 'Settings.tLang.1':
        return '中文(繁體)';
      case 'Settings.tLang.2':
        return '中文(简体)';
      case 'Settings.tLangText':
        return '语言:';
      case 'Settings.tSettings':
        return '设置';
      case 'Settings.tSave':
        return '储存此改变？';
      case 'Settings.tSaveDes':
        return '想要储存你的选择？';
      case 'Question.tQuestionnaire':
        return '问卷：';
      case 'Question.tQuestionType.0':
        return '夜尿频繁';
      case 'Question.tButtonText':
        return '联络长者';
      case 'Question.tContacted':
        return '已联络长者！';
      case 'Question.tAskFill':
        return '请您现在填写问卷';
      case 'Question.tEmpty':
        return '你还有问题未填写';
      case 'Question.tDone':
        return '问卷已填写！';
      case 'Question.tNotNow':
        return '暂时不要';
      case 'Question.tContact':
        return '联络长者';
      case 'Question.tIfNurse':
        return '请问您需要护士咨询服务吗？';
      case 'Question.tQuestion1':
        return '长者的夜尿次数是多少？';
      case 'Question.tQuestion2':
        return '长者夜尿的颜色是甚么？';
      case 'Question.tQuestion3':
        return '长者夜尿每次的量是多少？';
      case 'Question.tQuestion4':
        return '长者在睡前2小时喝了多少水/饮料？';
      case 'Question.tQuestion5':
        return '长者在夜尿前的一天有否进食刺激性食物或饮料 (包括咖啡、茶、酒等)？';
      case 'Question.tAnswer1.0':
        return '1次';
      case 'Question.tAnswer1.1':
        return '2次';
      case 'Question.tAnswer1.2':
        return '3次';
      case 'Question.tAnswer1.3':
        return '3次以上';
      case 'Question.tAnswer2.0':
        return '透明';
      case 'Question.tAnswer2.1':
        return '淡黄';
      case 'Question.tAnswer2.2':
        return '黄色';
      case 'Question.tAnswer2.3':
        return '深黄';
      case 'Question.tAnswer2.4':
        return '含血';
      case 'Question.tAnswer2.5':
        return '多泡';
      case 'Question.tAnswer3.0':
        return '比日间多';
      case 'Question.tAnswer3.1':
        return '与日间相若';
      case 'Question.tAnswer3.2':
        return '比日间少';
      case 'Question.tAnswer4.0':
        return '<200mL';
      case 'Question.tAnswer4.1':
        return '200-400 ML';
      case 'Question.tAnswer4.2':
        return '>400ML';
      case 'Question.tAnswer5.0':
        return '有';
      case 'Question.tAnswer5.1':
        return '无';
      case 'Question.tAnswer5.2':
        return '不知道';
      case 'Notification.tRule':
        return '规则名称';
      case 'Notification.tIf':
        return '如果爸爸的动作';
      case 'Notification.tDetact':
        return '检测到在';
      case 'Notification.tSelect':
        return '选择场所';
      case 'Notification.tIn':
        return '在';
      case 'Notification.tAnd':
        return '和';
      case 'Notification.tBet':
        return '之间';
      case 'Notification.tNotice':
        return '在指定时间后给我发通知';
      case 'Notification.tDone':
        return '完成';
      case 'Notification.tReset':
        return '重置';
      case 'Chat.tCircleofSupport':
        return '吴爷爷的支援圈';
      case 'Chat.tNurse':
        return '护士';
      case 'Chat.tEnter':
        return '输入信息';
      case 'locales.en_US':
        return 'English';
      case 'locales.zh_HK':
        return '中文(繁體)';
      case 'locales.zh_CN':
        return '中文(简体)';
      default:
        return null;
    }
  }
}

extension on _StringsZhHk {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'mainScreen.title':
        return '爸爸的健康概覽';
      case 'mainScreen.iconText.tDashBoardTitle':
        return 'Dad\'s Health Overview';
      case 'mainScreen.iconText.tMessageButton':
        return '信息';
      case 'mainScreen.iconText.tCircleofSupport':
        return '支援圈';
      case 'mainScreen.iconText.tNotice':
        return '通知';
      case 'mainScreen.iconText.tCall':
        return '通話';
      case 'mainScreen.iconText.tActivityClockTitle':
        return '居家活動時間表';
      case 'mainScreen.iconText.tCheckActivityReport':
        return '查看生活方式變化表';
      case 'mainScreen.tapMe':
        return 'Tap me';
      case 'mainScreen.tRooms.0':
        return '------';
      case 'mainScreen.tRooms.1':
        return '臥室';
      case 'mainScreen.tRooms.2':
        return '浴室';
      case 'mainScreen.tRooms.3':
        return '厨房';
      case 'mainScreen.tCNRooms.0':
        return '------';
      case 'mainScreen.tCNRooms.1':
        return '臥室';
      case 'mainScreen.tCNRooms.2':
        return '浴室';
      case 'mainScreen.tCNRooms.3':
        return '厨房';
      case 'mainScreen.warning.tAlert':
        return '最新緊急警報';
      case 'mainScreen.warning.tCheckAlert':
        return '查看所有警報';
      case 'mainScreen.warning.tNotWakeup':
        return '爸爸仍未起床！';
      case 'mainScreen.warning.tNotWakeupwithDate':
        return '8月11日 10:00AM 爸爸仍未起床';
      case 'mainScreen.warning.tWarningTitle':
        return '健康警告信號';
      case 'mainScreen.warning.tFormTitle':
        return '輔助問卷';
      case 'mainScreen.warning.tNormalText':
        return '正常';
      case 'mainScreen.warning.tAbnormalText':
        return '異常';
      case 'mainScreen.warning.tWarningText':
        return '警告';
      case 'mainScreen.healthBlock.tHealthBlockTitle':
        return '今日維生指數';
      case 'mainScreen.healthBlock.tHeartRate':
        return '心率';
      case 'mainScreen.healthBlock.tBloodOxygen':
        return '血氧含量';
      case 'mainScreen.healthBlock.tBloodPressure':
        return '血壓';
      case 'mainScreen.healthBlock.tBodyTemp':
        return '身體溫度';
      case 'mainScreen.healthBlock.tBloodSugar':
        return '血糖水平';
      case 'mainScreen.healthBlock.tHealthTitle':
        return '健康詳情';
      case 'warningScreen.tWarningTitle':
        return '健康警告信號';
      case 'warningScreen.tFormTitle':
        return '輔助問卷';
      case 'warningScreen.tNormalText':
        return '正常';
      case 'warningScreen.tAbnormalText':
        return '異常';
      case 'warningScreen.tWarningText':
        return '警告';
      case 'warningScreen.tContactElderly':
        return '聯絡長者';
      case 'warningScreen.tSettleNow':
        return '立即處理';
      case 'warningScreen.tRemind':
        return '稍後處理';
      case 'warningScreen.tSupport':
        return '爸爸的支援圈成員';
      case 'warningScreen.tLoc':
        return '長者鄰舍/活動中心的職員';
      case 'warningScreen.tMs':
        return '陳姑娘 （負責職員）';
      case 'warningScreen.tSave':
        return '請立即聯絡爸爸，確保安全';
      case 'warningScreen.tCallIme':
        return '立即通話';
      case 'warningScreen.tWakeupTime':
        return '[正常範圍:起床時間為6:30AM-7:30AM]';
      case 'warningScreen.tNotWakeup':
        return '8 月 11 日 10:00AM 爸爸仍未起床';
      case 'warningScreen.tSlpPtn':
        return '睡眠習慣';
      case 'warningScreen.tNocturia':
        return '夜尿頻繁情況';
      case 'warningScreen.tPastRV':
        return '[過去一星期的平均如廁次數為 2.34次]';
      case 'warningScreen.tPresentRV':
        return '8 月 9 日 2:00AM 爸爸的如廁次數增加了5%';
      case 'warningScreen.tToiletingHabit':
        return '如厠習慣';
      case 'warningScreen.tCheckAllActivities':
        return '查看所有活動';
      case 'profileScreen.tProfile':
        return '個人資料';
      case 'profileScreen.tEditProfile':
        return '編輯個人資料';
      case 'profileScreen.tMenu1':
        return '設定';
      case 'profileScreen.tMenu4':
        return '資訊';
      case 'profileScreen.tMenu2':
        return '賬單詳情';
      case 'profileScreen.tMenu3':
        return '用戶管理';
      case 'profileScreen.tlogout':
        return '登出';
      case 'profileScreen.tlogoutDiag':
        return '你是否想繼續登出？';
      case 'profileScreen.tYes':
        return '是';
      case 'profileScreen.tNo':
        return '否';
      case 'tGlobal.tNo':
        return '否';
      case 'tGlobal.tYes':
        return '是';
      case 'tGlobal.tCancel':
        return '取消';
      case 'tGlobal.tNext':
        return '下一步';
      case 'tGlobal.tLogin':
        return '登入';
      case 'tGlobal.tEmail':
        return '電子郵件';
      case 'tGlobal.tSignup':
        return '註冊';
      case 'tGlobal.tLogout':
        return '登出';
      case 'tGlobal.tDelete':
        return '刪除';
      case 'tGlobal.tPhoneNo':
        return '電話號碼';
      case 'tGlobal.tPassword':
        return '密碼';
      case 'tGlobal.tRepeatPW':
        return '重複密碼';
      case 'tGlobal.tFullName':
        return '全名';
      case 'tGlobal.tOlderCode':
        return '長者代碼';
      case 'tGlobal.tForgetPassword':
        return '忘記密碼';
      case 'tGlobal.tSignInWithGoogle':
        return '使用 Google 登入';
      case 'tGlobal.tConfirmSignUp':
        return '確認註冊';
      case 'noticeControl.tBreakfast':
        return '早餐';
      case 'noticeControl.tLunch':
        return '午餐';
      case 'noticeControl.tLunchNo':
        return '下午2:00至下午3:00之間通知我';
      case 'noticeControl.tDinner':
        return '晚餐';
      case 'noticeControl.tDinnerNo':
        return '下午10:00至下午11:00之間通知我';
      case 'noticeControl.tOther':
        return '其他用餐時間';
      case 'noticeControl.tNotgetup':
        return '早上10時仍未起床';
      case 'noticeControl.tNotgoBed':
        return '晚上12時後仍未入睡';
      case 'noticeControl.tNotify':
        return '在午夜00:00至01:00之間通知我';
      case 'noticeControl.tVisitToiletTime':
        return '白天上廁所超過10次';
      case 'noticeControl.tNotifyT':
        return '在晚上10:00至11:00之間通知我';
      case 'noticeControl.tOverstay':
        return '在浴室逗留時間過長';
      case 'noticeControl.tNotifyI':
        return '在上午10:00至11:00之間通知我';
      case 'noticeControl.tDoor':
        return '開門時間過長';
      case 'noticeControl.tQuan':
        return '本星期平均活動量低於過去一星期50%';
      case 'noticeControl.tStep':
        return '每日步伐次數';
      case 'noticeControl.tMeals':
        return '飲食';
      case 'noticeControl.tSleeping':
        return '睡眠';
      case 'noticeControl.tGoToRestroom':
        return '如厠';
      case 'noticeControl.tDoorOpen':
        return '門開';
      case 'noticeControl.tActiveTime':
        return '活動量';
      case 'circleOfSupportScreen.tCoSScreenTitle':
        return '爸爸的支援團';
      case 'circleOfSupportScreen.tCoSLeader':
        return '支援團隊長';
      case 'circleOfSupportScreen.tMember':
        return '成員';
      case 'circleOfSupportScreen.tCoSMember':
        return '支援團成員';
      case 'circleOfSupportScreen.tAddMember':
        return '添加成員';
      case 'circleOfSupportScreen.tManage':
        return '管理';
      case 'circleOfSupportScreen.tLeaveCos':
        return '離開支援團';
      case 'circleOfSupportScreen.tLeaveCoSHint':
        return '如果您不再是爸爸的支援團成員，您可隨時離開';
      case 'activityReport.tActivityReportTitle':
        return '爸爸的活動分析';
      case 'activityReport.tNormal':
        return '正常活動';
      case 'activityReport.tAbnormal':
        return '異常活動';
      case 'activityReport.tResult':
        return '數據分析結果';
      case 'activityReport.tBefore':
        return ' (前)';
      case 'activityReport.tAfter':
        return ' (後)';
      case 'activityReport.tNormalDescription':
        return '在睡覺期間並無活動';
      case 'activityReport.tAbnormalDescription':
        return '在夜間有異常活動';
      case 'chatListPage.tTitle':
        return '護士';
      case 'reportWidget.tLifestyle':
        return '生活習慣模式';
      case 'reportWidget.tWeekly':
        return '長者七日生活狀況';
      case 'reportWidget.tMonthly':
        return '長者一個月生活狀況';
      case 'reportWidget.tYearly':
        return '長者一年生活狀況';
      case 'reportWidget.tMeal':
        return '用餐時間';
      case 'reportWidget.tFreq':
        return '用膳頻率：';
      case 'reportWidget.tBF':
        return '早餐：';
      case 'reportWidget.tLunch':
        return '午餐：';
      case 'reportWidget.tDinner':
        return '晚餐：';
      case 'reportWidget.tSlp':
        return '睡眠習慣及質量';
      case 'reportWidget.tGetup':
        return '起床：';
      case 'reportWidget.tBed':
        return '就寢時間：';
      case 'reportWidget.tAvg':
        return '平均睡眠時數：';
      case 'reportWidget.tBodyMove':
        return '身體動作：中低程度';
      case 'reportWidget.tNight':
        return '夜間起床：';
      case 'Settings.tLang.0':
        return 'English';
      case 'Settings.tLang.1':
        return '中文(繁體)';
      case 'Settings.tLang.2':
        return '中文(简体)';
      case 'Settings.tLangText':
        return '語言:';
      case 'Settings.tSettings':
        return '設置';
      case 'Settings.tSave':
        return '儲存此改變？';
      case 'Settings.tSaveDes':
        return '想要儲存你的選擇？';
      case 'Question.tQuestionnaire':
        return '問卷：';
      case 'Question.tQuestionType.0':
        return '夜尿頻繁';
      case 'Question.tButtonText':
        return '聯絡長者';
      case 'Question.tContacted':
        return '已聯絡長者！';
      case 'Question.tAskFill':
        return '請您現在填寫問卷';
      case 'Question.tEmpty':
        return '你還有問題未填寫';
      case 'Question.tDone':
        return '問卷已填寫！';
      case 'Question.tNotNow':
        return '暫時不要';
      case 'Question.tContact':
        return '聯絡長者';
      case 'Question.tIfNurse':
        return '請問您需要護士諮詢服務嗎？';
      case 'Question.tQuestion1':
        return '長者的夜尿次數是多少？';
      case 'Question.tQuestion2':
        return '長者夜尿的顏色是甚麼？';
      case 'Question.tQuestion3':
        return '長者夜尿每次的量是多少？';
      case 'Question.tQuestion4':
        return '長者在睡前2小時喝了多少水/飲料？';
      case 'Question.tQuestion5':
        return '長者在夜尿前的一天有否進食刺激性食物或飲料 (包括咖啡、茶、酒等)？';
      case 'Question.tAnswer1.0':
        return '1次';
      case 'Question.tAnswer1.1':
        return '2次';
      case 'Question.tAnswer1.2':
        return '3次';
      case 'Question.tAnswer1.3':
        return '3次以上';
      case 'Question.tAnswer2.0':
        return '透明';
      case 'Question.tAnswer2.1':
        return '淡黃';
      case 'Question.tAnswer2.2':
        return '黃色';
      case 'Question.tAnswer2.3':
        return '深黃';
      case 'Question.tAnswer2.4':
        return '含血';
      case 'Question.tAnswer2.5':
        return '多泡';
      case 'Question.tAnswer3.0':
        return '比日間多';
      case 'Question.tAnswer3.1':
        return '與日間相若';
      case 'Question.tAnswer3.2':
        return '比日間少';
      case 'Question.tAnswer4.0':
        return '<200mL';
      case 'Question.tAnswer4.1':
        return '200-400 ML';
      case 'Question.tAnswer4.2':
        return '>400ML';
      case 'Question.tAnswer5.0':
        return '有';
      case 'Question.tAnswer5.1':
        return '無';
      case 'Question.tAnswer5.2':
        return '不知道';
      case 'Notification.tRule':
        return '規則名稱';
      case 'Notification.tIf':
        return '如果爸爸的動作';
      case 'Notification.tDetact':
        return '檢測到在';
      case 'Notification.tSelect':
        return '選擇場所';
      case 'Notification.tIn':
        return '在';
      case 'Notification.tAnd':
        return '和';
      case 'Notification.tBet':
        return '之間';
      case 'Notification.tNotice':
        return '在指定時間後給我發通知';
      case 'Notification.tDone':
        return '完成';
      case 'Notification.tReset':
        return '重置';
      case 'Chat.tCircleofSupport':
        return '吳伯伯的支援圈';
      case 'Chat.tNurse':
        return '護士';
      case 'Chat.tEnter':
        return '輸入訊息';
      case 'locales.en_US':
        return 'English';
      case 'locales.zh_HK':
        return '中文(繁體)';
      case 'locales.zh_CN':
        return '中文(简体)';
      default:
        return null;
    }
  }
}
