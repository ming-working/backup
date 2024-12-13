import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

class BloodOxygenChart extends StatefulWidget {
  final String chartName;
  final bool showTitle;

  const BloodOxygenChart(
      {super.key, this.chartName = '', this.showTitle = false});

  @override
  State<BloodOxygenChart> createState() => _BloodOxygenChartState();
}

class _BloodOxygenChartState extends State<BloodOxygenChart> {
  List<Color> gradientColors = [
    Colors.blue,
    Colors.white,
  ];

  double minX = 6;
  double maxX = 12;
  static double min = 1;
  static double max = 12;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: GestureDetector(
            onHorizontalDragUpdate: (dragUpdDet) {
              setState(() {
                // debugPrint(dragUpdDet.primaryDelta.toString());
                double primDelta = dragUpdDet.primaryDelta ?? 0.0;
                if (primDelta != 0) {
                  if (primDelta.isNegative && maxX < max) {
                    minX += maxX * 0.005;
                    maxX += maxX * 0.005;
                  } else if (minX > min) {
                    minX -= maxX * 0.005;
                    maxX -= maxX * 0.005;
                  }
                }
              });
            },
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    Widget text;
    switch (value.toStringAsFixed(2)) {
      case '1.00':
        text = const Text('8/8, 20:00', style: style);
        break;
      case '3.00':
        text = const Text('9/8, 9:00', style: style);
        break;
      case '5.00':
        text = const Text('9/8, 20:00', style: style);
        break;
      case '7.00':
        text = const Text('10/8, 9:00', style: style);
        break;
      case '9.00':
        text = const Text('10/8, 20:00', style: style);
        break;
      case '11.00':
        text = const Text('11/8 , 9:00', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    String text;
    switch (value.toInt()) {
      case 90:
        text = '90';
        break;
      case 95:
        text = '95';
        break;
      case 100:
        text = '99';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      clipData: const FlClipData.all(),
      lineTouchData: const LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          tooltipRoundedRadius: 10.0,
        ),
      ),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        // horizontalInterval: 1,
        // verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: widget.showTitle,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: widget.showTitle,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: widget.showTitle,
            reservedSize: 25,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        //border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: minX,
      maxX: maxX,
      minY: 90,
      maxY: 101,
      lineBarsData: [
        LineChartBarData(
          spots: bloodOxygenData,
          isCurved: true,
          color: Colors.blue,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: gradientColors,
          // ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ],
    );
  }
}
