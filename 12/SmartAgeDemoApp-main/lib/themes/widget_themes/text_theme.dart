import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartage_care/constants/colors.dart';

class SmartAgeTextTheme {
  SmartAgeTextTheme._();

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    // -- Title
    titleLarge: GoogleFonts.poppins(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: green900,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: green900,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: green900,
    ),
    // -- Display
    displayLarge: GoogleFonts.poppins(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: smartAgeBlack,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: smartAgeBlack,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: smartAgeBlack,
    ),
    // -- Body Text
    bodyLarge: GoogleFonts.poppins(
      fontSize: 24.0,
      color: smartAgeBlack,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: smartAgeBlack,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 10.0,
      color: smartAgeBlack,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 12.0,
      color: Colors.grey,
    ),
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = const TextTheme();
}
