import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/image_strings.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/screens/authenticate/sign_in_screen.dart';
import 'package:smartage_care/screens/authenticate/sign_up_screen.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height; // get the screen height
    final width = MediaQuery.of(context).size.width; // get the screen width
    final logoSize = width / 1.5; // get the logo size: can be changed later.

    return Scaffold(
      backgroundColor: grey000,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: smartAgeDefaultSize,
          horizontal: smartAgeDefaultSize,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: const AssetImage(smartAgeLogoImage2),
                width: logoSize,
                height: logoSize,
              ),
              SizedBox(
                height: height / 8,
              ),
              SmartAgeElevatedButton(
                width: 250,
                onPressed: () {
                  Get.to(() => const SignIn());
                },
                light: false,
                text: "globalLogIn".tr,
              ),
              const SizedBox(
                height: smartAgeDefaultSize,
              ),
              SmartAgeElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUp());
                },
                light: true,
                text: "globalRegister".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
