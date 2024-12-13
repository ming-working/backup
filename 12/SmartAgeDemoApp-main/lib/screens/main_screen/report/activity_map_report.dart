import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
//import 'package:smartage_care/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/screens/main_screen/questionnaire/widgets/appbar.dart';
import 'package:smartage_care/widgets/activity_clock/activity_clock_sample.dart';
import 'package:smartage_care/widgets/app_bar.dart';
//import 'package:smartage_care/src/features/core/screens/report/widgets/activity_clock_sample.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:smartage_care/i18n/strings.g.dart';

// toggle button text
List<Widget> clocks = <Widget>[
  Text(t.activityReport.tNormal),
  Text(t.activityReport.tAbnormal),
];
// const List<Widget> clocks = <Widget>[
//   Text('正常活動'),
//   Text('異常活動'),
// ];

const List<String> dates = [
  '1/1/2024',
  '1/2/2024',
];

class ActivityReport extends StatefulWidget {
  const ActivityReport({super.key});

  @override
  State<ActivityReport> createState() => _ActivityReportState();
}

class _ActivityReportState extends State<ActivityReport> {
  final List<bool> _selectedClocks = <bool>[true, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: const SmartAgeAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(smartAgeActivityReportPadding),
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        t.activityReport.tActivityReportTitle,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                analysisResultBox(),
                const SizedBox(height: 10),
                activityToggleButton(),
                const SizedBox(height: 15),
                ActivityClockSample(
                  isNormalDate: _selectedClocks[0],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ToggleButtons activityToggleButton() {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedClocks.length; i++) {
            _selectedClocks[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: smartAgePrimaryColor,
      selectedColor: smartAgeBlack,
      fillColor: smartAgePrimaryColor.withOpacity(0.8),
      color: smartAgeBlack,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 120.0,
      ),
      isSelected: _selectedClocks,
      children: clocks,
    );
  }

  Container analysisResultBox() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(3, 212, 190, 1),
              Color.fromRGBO(4, 164, 252, 0.5),
            ],
            stops: [
              0.05,
              0.8
            ]),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StrokeText(
                text: t.activityReport.tResult,
                // text: "數據分析結果",
                textColor: Colors.white,
                strokeWidth: 2.5,
                strokeColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 40),
                width: 180,
                child: Text(
                  dates[0] + t.activityReport.tBefore,
                  // dates[0] + " (前)",
                  style: TextStyle(
                    fontSize: 15,
                    color: smartAgeWhite,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  dates[1] + t.activityReport.tAfter,
                  // dates[1] + " (後)",
                  style: TextStyle(fontSize: 15, color: smartAgeWhite),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                width: 180,
                child: Text(
                  t.activityReport.tNormalDescription,
                  // "在睡覺期間並無活動",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                width: 180,
                child: Text(
                  t.activityReport.tAbnormalDescription,
                  // "在夜間有異常活動",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              //Text("        ")
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
