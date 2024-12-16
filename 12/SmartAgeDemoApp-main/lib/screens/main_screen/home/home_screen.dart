/* 
  Widget for HomeScreen Screen. This will be shown up on the Dashboard Widget.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/screens/main_screen/alert/warning_small_box_widget.dart';
import 'package:smartage_care/screens/main_screen/report/activity_map_report.dart';
import 'package:smartage_care/screens/main_screen/report/life_style_report.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';
import 'package:smartage_care/widgets/activity_clock/activity_clock.dart';
import 'package:smartage_care/widgets/bodyheath/health_block.dart';
import 'package:smartage_care/i18n/strings.g.dart';

// import 'package:smartage_care/widgets/activity_clock/activity_clock.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // TODO: need to delete this
  // TODO: need to delete this

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        '${t.mainScreen.healthBlock.tHealthBlockTitle}'.tr,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      // SvgPicture.asset(
                      //   'assets/icons/fi-rs-caret-right.svg', // Replace with your SVG file path
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: smartAgeDefaultSize / 2,
                ),

                const BodyHealthBlocks(),
                const SizedBox(
                  height: smartAgeDefaultSize / 2,
                ),
                const SizedBox(
                  height: smartAgeDefaultSize / 2,
                ),
                const WarningSmallBox(),
                const SizedBox(
                  height: smartAgeDefaultSize,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the padding as needed
                  child: Text(
                    '${t.mainScreen.iconText.tActivityClockTitle}'.tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(
                    height: 16), // Add some spacing between the text and button
                Center(
                  child: SmartAgeElevatedButton(
                    width: 260,
                    onPressed: () {
                      Get.to(
                        () => const Scaffold(
                          body: Center(
                            child: ActivityReport(),
                          ),
                        ),
                      );
                    },
                    light: true,
                    text: '${t.mainScreen.iconText.tCheckActivityReport}'.tr,
                  ),
                ),

                GestureDetector(
                  // splashColor: Colors.transparent, // Disable splash effect
                  // highlightColor:
                  //     Colors.transparent, // Disable highlight effect
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LifeStyleReportPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: const ActivityClock(),
                  ),
                ),
                /*
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: const ActivityClock(),
                ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
