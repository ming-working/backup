import 'package:fl_chart/fl_chart.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class HealthData {
  final String name;
  final List<FlSpot> data1;
  var data2;
  final double minY;
  final double maxY;

  HealthData(
      {required this.name,
      required this.minY,
      required this.maxY,
      required this.data1,
      this.data2});
}

class HealthDataList {
  List<HealthData> healthDataList = [];

  HealthDataList() {
    healthDataList.add(
      HealthData(
        name: "Heart Rate",
        minY: 50,
        maxY: 80,
        data1: heartRateData,
      ),
    );
    healthDataList.add(
      HealthData(
          name: "Blood Pressure",
          minY: 55,
          maxY: 130,
          data1: bpDiastolicData,
          data2: bpSystolicData),
    );
    healthDataList.add(
      HealthData(
        name: t.mainScreen.healthBlock.tBloodOxygen,
        minY: 90,
        maxY: 100,
        data1: bloodOxygenData,
      ),
    );
  }

  HealthData getData(String name) {
    for (var data in healthDataList) {
      if (data.name == name) {
        return data;
      }
    }
    return healthDataList[0];
  }
}

List<FlSpot> heartRateData = const [
  FlSpot(1, 65.06),
  FlSpot(2, 70.35),
  FlSpot(3, 64.11),
  FlSpot(4, 65.28),
  FlSpot(5, 65.06),
  FlSpot(6, 70.35),
  FlSpot(7, 64.11),
  FlSpot(8, 65.28),
  FlSpot(9, 59.33),
  FlSpot(10, 57.69),
  FlSpot(11, 59.22),
  FlSpot(12, 60.22),
];

List<FlSpot> bpDiastolicData = const [
  FlSpot(1, 65),
  FlSpot(2, 70),
  FlSpot(3, 64),
  FlSpot(4, 60),
  FlSpot(5, 65),
  FlSpot(6, 70),
  FlSpot(7, 69),
  FlSpot(8, 65),
  FlSpot(9, 69),
  FlSpot(10, 75),
  FlSpot(11, 72),
  FlSpot(12, 67),
];

List<FlSpot> bpSystolicData = const [
  FlSpot(1, 119),
  FlSpot(2, 95),
  FlSpot(3, 114),
  FlSpot(4, 95),
  FlSpot(5, 105),
  FlSpot(6, 111),
  FlSpot(7, 93),
  FlSpot(8, 91),
  FlSpot(9, 113),
  FlSpot(10, 120),
  FlSpot(11, 107),
  FlSpot(12, 103),
];

List<FlSpot> bloodOxygenData = const [
  FlSpot(1, 98),
  FlSpot(2, 95),
  FlSpot(3, 97),
  FlSpot(4, 97),
  FlSpot(5, 99),
  FlSpot(6, 96),
  FlSpot(7, 95),
  FlSpot(8, 97),
  FlSpot(9, 97),
  FlSpot(10, 98),
  FlSpot(11, 96),
  FlSpot(12, 97),
];
