import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

/* -- Light & Dark Elevated Button Themes -- */
class SmartAgeElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool light;
  final String text;
  final double height;
  final double width;

  const SmartAgeElevatedButton({
    super.key,
    required this.onPressed,
    required this.light,
    required this.text,
    this.height = 46,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: light ? grey000 : green900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            color: green900,
            width: 1,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: light ? green900 : Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
