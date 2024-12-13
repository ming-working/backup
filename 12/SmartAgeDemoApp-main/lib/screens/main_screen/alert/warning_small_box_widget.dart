import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stroke_text/stroke_text.dart';

import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/image_strings.dart';
import 'package:smartage_care/screens/main_screen/alert/warning_page.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class WarningSmallBox extends StatelessWidget {
  const WarningSmallBox({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width - 60;
    // final height = MediaQuery.of(context).size.width / 2 + 25;
    // final patternList = WarningPatternList();
    //final pattern = patternList.list[index]; //change warning pattern here

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.yellow
          ], // Replace with your desired gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        // width: MediaQuery.of(context).size.width,
        // height: 150,

        onTap: () {
          Get.to(() => const WarningPage());
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Stack(children: [
            Positioned(
              right: 0,
              child: SizedBox(
                width: 100,
                child: Image.asset(smartAgeBedImage,
                    fit: BoxFit.contain, alignment: Alignment.topRight),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.warning,
                          color: Colors.yellow,
                        ),
                        Text(
                          // "最新緊急警報",
                          t.mainScreen.warning.tAlert,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    InkWell(
                        // style: OutlinedButton.styleFrom(
                        //   backgroundColor: Colors.transparent,
                        //   side: BorderSide.none,
                        // ),
                        onTap: () {
                          Get.to(() => const WarningPage());
                        },
                        child: Text(
                          t.mainScreen.warning.tCheckAlert,
                          style: const TextStyle(
                              color: smartAgeBlack,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                              fontWeight: FontWeight.bold),
                        )),
                    // SizedBox(width: 100),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     side: BorderSide.none,
                    //     backgroundColor: Colors.transparent,
                    //      // Set the background color to transparent
                    //   ),
                    //   onPressed: (){Get.to(WarningPage());},
                    //   child: Text("查看所有警報")
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //the first row of data
                StrokeText(
                  text: t.mainScreen.warning.tNotWakeup,
                  // text: "爸爸早上仍未起床！",
                  textColor: smartAgeWhite,
                  strokeWidth: 6,
                  strokeColor: smartAgeBlack,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Text(
                  t.mainScreen.warning.tNotWakeupwithDate,
                  // "8月11日 10:00AM 爸爸仍未起床",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
