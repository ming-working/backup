import 'dart:math' as math;

import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';

import 'helper/daily_activity.dart';
import 'package:flutter/material.dart';

class SegmentPainter extends CustomPainter {
  double radius;
  String area;
  List<DailyActivity> activityList;
  var timeList = [];
  Color rcolor;
  final bool isCurrentTime;
  // final ArcsCallback onArcsChanged;

  SegmentPainter({
    required this.radius,
    required this.area,
    required this.activityList,
    this.rcolor = smartAgePrimaryColor,
    this.isCurrentTime = false,
    // required this.onArcsChanged,
  });

  void getTimeList() {
    final list =
        activityList.where((activity) => activity.area == area).toList();
    //list.length
    for (var element in list) {
      timeList.add(element.getTime());
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // rect: the fitting container of ring
    final rect = Rect.fromLTRB(-radius, -radius, radius, radius);
    const startAngle = 0.0;
    const sweepAngle = 2 * math.pi;
    var useCenter = false;
    DateTime currentTime = DateTime.now();

    getTimeList();

    var basepaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = smartAgeClockStrokeWidth;

    var paint = Paint()
      ..color = rcolor
      ..style = PaintingStyle.stroke
      ..strokeWidth = smartAgeClockStrokeWidth;

    // draw the background ring
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, basepaint);

    // draw each colorful segments in the ring
    for (var i in timeList) {
      //start from 24 by rotate -90 degree + hour + minutes
      // i[0]: hour, i[1]: minute, i[2]: duration
      if (isCurrentTime &&
          (i[0] > currentTime.hour ||
              (i[0] == currentTime.hour && i[1] > currentTime.minute))) {
        break;
      }
      var startAngle2 =
          -math.pi / 2 + i[0] / 12 * math.pi + i[1] / 60 / 12 * math.pi;
      var sweepAngle2 = i[2] * 2 * math.pi / 60 / 24;
      final path = Path();
      path.arcTo(rect, startAngle2, sweepAngle2, true);

      canvas.drawPath(path, paint);

      // Optional version:
      // -----
      // canvas.drawArc(rect, startAngle2, sweepAngle2, useCenter, paint);
      // arcs.add(ArcData(
      //     name: area,
      //     startTime: '',
      //     endTime: '',
      //     path: Path()..addArc(rect, startAngle2, sweepAngle2)));
    }

    // onArcsChanged(arcs);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
