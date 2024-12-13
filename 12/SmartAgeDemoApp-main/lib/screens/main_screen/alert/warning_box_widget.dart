import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
import 'dart:ui' as ui;
import 'package:smartage_care/constants/image_strings.dart';
import 'package:stroke_text/stroke_text.dart';

import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class WarningBox extends StatelessWidget {
  final int index;

  const WarningBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 70;
    final height = MediaQuery.of(context).size.width / 2 + 40;
    final patternList = WarningPatternList();
    final pattern = patternList.list[index]; //change warning pattern here

    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: [
        Container(
            width: width,
            height: height,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pattern.icon),
                scale: 1.9,
                alignment: Alignment.topRight, // set the alignment here
              ),
            ),
            child: CustomPaint(
                painter:
                    BoxPainter(pattern.primaryColor, pattern.secondaryColor))),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //the first row of data
              StrokeText(
                text: pattern.title,
                textColor: smartAgeWhite,
                strokeWidth: 6,
                strokeColor: smartAgeBlack,
                textStyle: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 6),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),

              Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        stops: [0.3, 1],
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    pattern.signalText,
                    style: const TextStyle(
                        color: smartAgeWhite, fontWeight: FontWeight.bold),
                  ))),
              const SizedBox(
                height: 5,
              ),
              Text(
                pattern.normalText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Stack(
                children: [
                  Text(
                    pattern.warningText,
                    style: TextStyle(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black,
                      /*shadows: [
                        Shadow(
                          offset: Offset(0, 6),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],*/
                    ),
                  ),
                  Text(pattern.warningText,
                      style: TextStyle(color: smartAgeWhite)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // '查看所有活動',
                    t.warningScreen.tCheckAllActivities,
                    style: TextStyle(color: smartAgeWhite),
                  ),
                  Text(
                    pattern.bottomTitleText,
                    style: TextStyle(color: smartAgeWhite),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// paint the background rectangle with linear gradient
class BoxPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  BoxPainter(this.primaryColor, this.secondaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset(0, 0) & const Size(350, 220);

    var paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10
      ..shader = ui.Gradient.linear(
        rect.centerLeft,
        rect.centerRight,
        [
          primaryColor,
          secondaryColor,
        ],
      );

    var path = Path();
    path.moveTo(40, 25);
    path.quadraticBezierTo(5, 20, 0, 60);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(0, size.height, 30, size.height);
    path.lineTo(size.width - 30, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 120);
    path.quadraticBezierTo(size.width, 100, size.width - 20, 90);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class WarningPattern {
  final String title;
  final icon;
  final signalText;
  final normalText;
  final warningText;
  final bottomTitleText;
  final Color primaryColor;
  final Color secondaryColor;

  WarningPattern(
    this.title,
    this.icon,
    this.signalText,
    this.normalText,
    this.warningText,
    this.bottomTitleText,
    this.primaryColor,
    this.secondaryColor,
  );
}

class WarningPatternList {
  List<WarningPattern> list = [];

  // index: different warning
  // WarningPatternList() {
  //   list.add(WarningPattern(
  //       '早上仍未起床',
  //       tBedImage,
  //       tWarningText,
  //       '[正常範圍:起床時間為6:30AM-7:30AM]',
  //       '8 月 11 日 10:00AM 爸爸仍未起床',
  //       '睡眠習慣',
  //       Colors.orangeAccent,
  //       Colors.blueAccent));
  //   list.add(WarningPattern(
  //       '夜尿頻繁情況',
  //       tToiletImage,
  //       tWarningText,
  //       '[過去一星期的平均如廁次數為 2.34次]',
  //       '8 月 9 日 2:00AM 爸爸的如廁次數增加了5%',
  //       '如厠習慣',
  //       Colors.blue,
  //       Colors.purple));
  //   list.add(WarningPattern('98 %', tLungImage, tNormalText, 'normalText',
  //       '10 月 7 日 - 10:00AM 平均血氧含量達致98%', '如厠習慣', Colors.amber, Colors.black));
  //   list.add(WarningPattern(
  //       '異常睡眠活動',
  //       tSleepingImage,
  //       tWarningText,
  //       'normalText',
  //       '10 月 7 日 9:00PM-7:00AM 爸爸的睡眠活動密度比平均增加了15%',
  //       '如厠習慣',
  //       Colors.green,
  //       Colors.blue));
  //   list.add(WarningPattern(
  //       '未服藥',
  //       tPillImage,
  //       tWarningText,
  //       '[正常範圍於上午10:30至11:00第一次服藥]',
  //       '10 月 7 日 - 11:00AM 爸爸仍未服藥記錄',
  //       '如厠習慣',
  //       Colors.amber,
  //       Colors.red));
  //   list.add(WarningPattern(
  //       '102/72mmHg',
  //       tListenerImage,
  //       tNormalText,
  //       '[正常範圍於上午10:30至11:00第一次服藥]',
  //       '10 月 7 日 - 10:00AM 平均血壓為102/72 mmHg',
  //       '如厠習慣',
  //       Colors.tealAccent,
  //       Colors.black));
  // }

  WarningPatternList() {
    list.add(WarningPattern(
        t.mainScreen.warning.tNotWakeup,
        smartAgeBedImage,
        t.warningScreen.tWarningText,
        t.warningScreen.tWakeupTime,
        t.warningScreen.tNotWakeup,
        t.warningScreen.tSlpPtn,
        Colors.orangeAccent,
        Colors.blueAccent));
    list.add(WarningPattern(
        t.warningScreen.tNocturia,
        smartAgeToiletImage,
        t.warningScreen.tWarningText,
        t.warningScreen.tPastRV,
        t.warningScreen.tPresentRV,
        t.warningScreen.tToiletingHabit,
        Colors.blue,
        Colors.purple));
    list.add(WarningPattern(
        '98 %',
        smartAgeLungImage,
        tNormalText,
        'normalText',
        '10 月 7 日 - 10:00AM 平均血氧含量達致98%',
        '如厠習慣',
        Colors.amber,
        Colors.black));
    list.add(WarningPattern(
        '異常睡眠活動',
        smartAgeSleepingImage,
        tWarningText,
        'normalText',
        '10 月 7 日 9:00PM-7:00AM 爸爸的睡眠活動密度比平均增加了15%',
        '如厠習慣',
        Colors.green,
        Colors.blue));
    list.add(WarningPattern(
        '未服藥',
        smartAgePillImage,
        tWarningText,
        '[正常範圍於上午10:30至11:00第一次服藥]',
        '10 月 7 日 - 11:00AM 爸爸仍未服藥記錄',
        '如厠習慣',
        Colors.amber,
        Colors.red));
    list.add(WarningPattern(
        '102/72mmHg',
        smartAgeListenerImage,
        tNormalText,
        '[正常範圍於上午10:30至11:00第一次服藥]',
        '10 月 7 日 - 10:00AM 平均血壓為102/72 mmHg',
        '如厠習慣',
        Colors.tealAccent,
        Colors.black));
  }
}
