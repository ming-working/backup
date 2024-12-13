import 'package:smartage_care/screens/welcome_screen/welcome_screen.dart';
import 'package:smartage_care/services/localization/app_translation.dart';
import 'package:smartage_care/services/service_initialization.dart';
import 'package:smartage_care/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // managing the interaction between the flutter app and the underlying Flutter Engine.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the backend system when launching the app
  // For now, it intializes the Firebase Core.
  await ServiceInitializer.initializeBackend();

  runApp(const SmartAgeCare());
}

class SmartAgeCare extends StatelessWidget {
  const SmartAgeCare({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // remove debugShowBanner for Demo Purpose.
      debugShowCheckedModeBanner: false,

      // We only support light theme for now -> no design`
      // change this to ThemeMode.system for system theme
      themeMode: ThemeMode.light,
      theme: SmartAgeAppTheme.lightTheme,

      // Transition between screens
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),

      // Localization
      locale: Get.deviceLocale,
      // Exception Handler -> if the locale of device is not one of the supported locales.
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslation(), // Translation Provider

      // App Title
      title: 'SmartAge Care',

      // Build the application
      home: Builder(
        builder: (context) {
          return const WelcomeScreen();
        },
      ),
      // locale: TranslationProvider.of(context).flutterLocale,,
    );
  }
}
