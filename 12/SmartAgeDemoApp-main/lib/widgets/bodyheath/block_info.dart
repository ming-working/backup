import 'widgets/line_chart.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class HealthBlock {
  final String title;
  final String icon;
  String details;
  num state;
  final chart;

  HealthBlock(
      {required this.title,
      required this.icon,
      this.details = 'details',
      this.state = 0,
      this.chart});
}

class HealthBlockList {
  List<HealthBlock> hbl = [];

  HealthBlockList() {
    hbl.add(
      HealthBlock(
        title: t.mainScreen.healthBlock.tHeartRate,
        icon: "assets/icons/heart.png",
        details: '65 bpm',
        chart: const LineChartView(chartName: 'HeartRate'),
      ),
    );
    hbl.add(
      HealthBlock(
        title: t.mainScreen.healthBlock.tBloodOxygen,
        icon: "assets/icons/bloodpressure.png",
        details: '98 %',
        chart: const LineChartView(chartName: 'BloodOxygen'),
      ),
    );
    hbl.add(
      HealthBlock(
        title: t.mainScreen.healthBlock.tBloodPressure,
        icon: "assets/icons/drop.png",
        details: '102 / 72 mmhg',
        chart: const LineChartView(chartName: 'BloodPressure'),
      ),
    );
    hbl.add(
      HealthBlock(
        title: t.mainScreen.healthBlock.tBodyTemp,
        icon: "assets/icons/bloodpressure.png",
        details: '36.5 \u{2103}',
        chart: const LineChartView(chartName: 'BodyTemp'),
      ),
    );
    hbl.add(
      HealthBlock(
        title: t.mainScreen.healthBlock.tBloodSugar,
        icon: "assets/icons/drop.png",
        details: '6 mmol/L',
        chart: const LineChartView(),
      ),
    );
  }
}
