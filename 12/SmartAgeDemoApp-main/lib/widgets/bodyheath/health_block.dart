import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/i18n/strings.g.dart';
import 'package:smartage_care/widgets/bodyheath/blood_oxygen_page.dart';
import 'package:smartage_care/widgets/bodyheath/blood_pressure_page.dart';
import 'package:smartage_care/widgets/bodyheath/widgets/blood_oxygen_chart.dart';
import 'package:smartage_care/widgets/bodyheath/widgets/blood_pressure_chart.dart';
import 'package:smartage_care/widgets/bodyheath/widgets/body_temperature_chart.dart';

import 'widgets/line_chart.dart';
import 'block_info.dart';
import 'heart_rate_page.dart';
import 'package:smartage_care/screens/main_screen/settings/settings.dart';

class BodyHealthBlocks extends StatefulWidget {
  const BodyHealthBlocks({super.key});

  @override
  State<BodyHealthBlocks> createState() => _BodyHealthBlocksState();
}

class _BodyHealthBlocksState extends State<BodyHealthBlocks> {
  final colorlist = [
    Colors.red,
    Colors.yellow,
    smartAgeIconBgColor,
    Colors.yellow,
    smartAgeIconBgColor,
  ];

  final hblist = HealthBlockList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Get.to(() => const HeartRatePage());
                  break;
                case 1:
                  Get.to(() => const BloodOxygenPage());
                  break;
                case 2:
                  Get.to(() => const BloodPressurePage());
                  break;
                default:
                  break;
              }
            },
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: smartAgeGreyColor,
                    width: 1.0,
                  ),
                  color: colorlist[index],
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Image.asset(
                            hblist.hbl[index].icon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(hblist.hbl[index].title),
                      ],
                    ),
                    //realtime data + mesurement unit
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Text(
                            hblist.hbl[index].details,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    //正常，異常
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 60,
                        height: 23,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: smartAgeGreyColor,
                              width: 1.0,
                            ),
                            color: Colors.white.withAlpha(180),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(child: Text(t.warningScreen.tNormalText)),
                      ),
                    ),
                    (index == 1)
                        ? const BloodOxygenChart()
                        : (index == 2)
                            ? const BloodPressureChart()
                            : (index == 3)
                                ? const BodyTemperatureChart()
                                : const LineChartView()
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}
