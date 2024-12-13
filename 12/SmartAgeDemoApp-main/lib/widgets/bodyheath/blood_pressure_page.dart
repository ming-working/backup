import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/i18n/strings.g.dart';
import 'package:smartage_care/widgets/bodyheath/widgets/blood_pressure_chart.dart';

class BloodPressurePage extends StatelessWidget {
  const BloodPressurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Health",
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: smartAgeIconBgColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.9],
              colors: [
                smartAgeIconBgColor,
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.all(smartAgeDashboardCardPadding),
          child: Column(children: [
            Stack(children: [
              SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Image.asset("assets/images/health/listener.png")),
              Positioned(
                bottom: 20,
                left: 50,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 1],
                        colors: [
                          smartAgeNormalColor,
                          smartAgeGreyColor,
                        ],
                        tileMode: TileMode.clamp,
                      )
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: tDarkColor.withOpacity(0.5),
                      //     spreadRadius: 1,
                      //     blurRadius: 3,
                      //     offset: Offset(0, 3),
                      //   ),
                      // ],
                      // border: Border.all(
                      //   color: tDarkColor,
                      //   width: 1.0,
                      // ),
                      ),
                  child: Center(
                      child: Text(
                    t.warningScreen.tNormalText,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  )),
                ),
              ),
            ]),
            Expanded(
                child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: smartAgeGreyColor,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Blood Pressure ( mmhg / date )',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: BloodPressureChart(showTitle: true),
                  ),
                ],
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
