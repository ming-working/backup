import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';

import 'package:smartage_care/themes/widget_themes/appbar_theme.dart';
import 'package:smartage_care/themes/widget_themes/outlined_button_theme.dart';
import 'package:smartage_care/themes/widget_themes/text_theme.dart';

class SmartAgeAppTheme {
  SmartAgeAppTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: const MaterialColor(
      0xFF004D37,
      <int, Color>{
        50: green100, // need to be changed
        100: green100,
        200: green100, // need to be changed
        300: green300,
        400: green300, // need to be changed
        500: green500,
        600: green600,
        700: green700,
        800: green700, // need to be changed
        900: green900,
      },
    ),
    brightness: Brightness.light,
    textTheme: SmartAgeTextTheme.lightTextTheme,
    appBarTheme: SmartAgeAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: SmartAgeOutlinedButtonTheme.lightOutlinedButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  // SmartAgeDarkTheme can be added later
  static ThemeData darkTheme = ThemeData();
}
