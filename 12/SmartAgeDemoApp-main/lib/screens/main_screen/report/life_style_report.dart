import 'package:flutter/material.dart';
import 'package:smartage_care/screens/main_screen/questionnaire/widgets/appbar.dart';
import 'package:smartage_care/widgets/activity_clock/activity_clock.dart';
//import 'package:smartage_care/src/features/core/screens/dashboard/widgets/appbar.dart';

import 'package:smartage_care/screens/main_screen/report/report_widget.dart';
import 'package:smartage_care/widgets/app_bar.dart';

class LifeStyleReportPage extends StatelessWidget {
  const LifeStyleReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: const SmartAgeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Center(child: ActivityClock()),
            LifeStyleWidget(),
          ]),
        ),
      ),
    ));
  }
}
