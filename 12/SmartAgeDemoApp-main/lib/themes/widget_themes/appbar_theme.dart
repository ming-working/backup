import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class SmartAgeAppBarTheme {
  SmartAgeAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 10,
    centerTitle: true,
    backgroundColor: smartAgeWhite,
    iconTheme: IconThemeData(color: smartAgeWhite, size: 18.0),
    actionsIconTheme: IconThemeData(color: smartAgeWhite, size: 18.0),
  );
  static const darkAppBarTheme = AppBarTheme();
}
