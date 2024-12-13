import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/services/authentication/signout/sign_out_controller.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';

Future<dynamic> smartAgeSignOutPopUp(
  BuildContext context,
  SignOutController controller,
) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(smartAgeDefaultSize),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "profileScreenLogoutDialog".tr,
              style: GoogleFonts.poppins(
                color: green900,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: smartAgeDefaultSize * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SmartAgeElevatedButton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  onPressed: () async {
                    controller.signOutUser();
                  },
                  light: true,
                  text: "globalYes".tr,
                ),
                const SizedBox(width: 35),
                SmartAgeElevatedButton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  onPressed: () {
                    // need to close the pop up
                    Get.back();
                  },
                  light: false,
                  text: "globalNo".tr,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
