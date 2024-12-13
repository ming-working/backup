import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class SmartAgeOutlinedButtonTheme {
  SmartAgeOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: blue700,
      side: const BorderSide(color: blue700),
      padding: const EdgeInsets.symmetric(vertical: smartAgeButtonHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );

  /* -- Dark Theme -- */
  static const darkOutlinedButtonTheme = OutlinedButtonThemeData();
}
