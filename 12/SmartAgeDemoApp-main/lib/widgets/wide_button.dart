// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';

enum ButtonDesign { primary, secondary, alert }

class WideButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonDesign design;
  final double width;
  final bool disabled;

  const WideButton({
    super.key,
    required this.width,
    required this.text,
    required this.onPressed,
    this.design = ButtonDesign.primary,
    required this.disabled,
  });
  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor; // Define textColor variable
    double elevation;

    if (disabled) {
      backgroundColor = Colors.grey;
      textColor = grey300;
      elevation = 0.0;
    } else {
      switch (design) {
        case ButtonDesign.primary:
          backgroundColor = const Color(0xFF004C37);
          textColor = Colors.white; // Set textColor for primary design
          elevation = 1.0;
          break;
        case ButtonDesign.secondary:
          backgroundColor = Colors.white;
          textColor =
              const Color(0xFF004C37); // Set textColor for secondary design
          elevation = 1.0;
          break;
        case ButtonDesign.alert: // Handle the new alert design
          backgroundColor = Colors.white;
          textColor = Colors.red; // Set textColor for alert design
          elevation = 1.0;
          break;
      }
    }

    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          foregroundColor: textColor,
          backgroundColor:
              backgroundColor, // This sets the text color for the ElevatedButton
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: textColor), // Use textColor for the border color
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 12.0), // Set the padding here
        ),
        onPressed:
            disabled ? null : onPressed, // Disable button if disabled is true
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold), // Apply textColor to Text widget
        ),
      ),
    );
  }
}
