import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'animated_circular_chart.dart';
import 'circular_chart.dart';
import 'stack.dart';

class AnimatedCircularChartPainter extends CustomPainter {
  AnimatedCircularChartPainter(this.animation, this.labelPainter)
      : super(repaint: animation);

  final Animation<CircularChart> animation;
  final List<TextPainter> labelPainter;

  @override
  void paint(Canvas canvas, Size size) {
    _paintLabel(canvas, size, labelPainter);
    _paintChart(canvas, size, animation.value);
  }

  @override
  bool shouldRepaint(AnimatedCircularChartPainter oldDelegate) => false;
}

class CircularChartPainter extends CustomPainter {
  CircularChartPainter(this.chart, this.labelPainter);

  final CircularChart chart;
  final List<TextPainter> labelPainter;

  @override
  void paint(Canvas canvas, Size size) {
    _paintLabel(canvas, size, labelPainter);
    _paintChart(canvas, size, chart);
  }

  @override
  bool shouldRepaint(CircularChartPainter oldDelegate) => false;
}

const double _kRadiansPerDegree = math.pi / 180;

void _paintLabel(Canvas canvas, Size size, List<TextPainter> labelPainter) {
  // get the total hight of the Text
  double textHeight = 0;
  for (var v = 0; v < labelPainter.length; v++) {
    textHeight = (labelPainter.length * labelPainter[v].height) + textHeight;
  }

  double heightAdjustment = 0;

  for (var v = 0; v < labelPainter.length; v++) {
    labelPainter[v].paint(
      canvas,
      Offset(
        size.width / 2 - labelPainter[v].width / 2,
        (size.height / 2 - labelPainter[v].height / 2) -
            heightAdjustment +
            textHeight / 15,
      ),
    );
    heightAdjustment = heightAdjustment + labelPainter[v].height;
  }
}

void _paintChart(Canvas canvas, Size size, CircularChart chart) {
  final Paint segmentPaint = Paint()
    ..style = chart.chartType == CircularChartType.Radial
        ? PaintingStyle.stroke
        : PaintingStyle.fill
    ..strokeCap = chart.edgeStyle == SegmentEdgeStyle.round
        ? StrokeCap.round
        : StrokeCap.butt;

  double finalradius = 0;
  for (final CircularChartStack stack in chart.stacks) {
    for (final segment in stack.segments) {
      segmentPaint.color = segment.color;
      segmentPaint.strokeWidth = stack.width;

      finalradius = stack.radius;

      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: stack.radius,
        ),
        stack.startAngle * _kRadiansPerDegree,
        segment.sweepAngle * _kRadiansPerDegree,
        chart.chartType == CircularChartType.Pie,
        segmentPaint,
      );
    }
  }

  //canvas.save();

  final Paint tickPaint = Paint();
  var textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
      textStyle = const TextStyle(
        color: Colors.black,
        fontFamily: 'Times New Roman',
        fontSize: 15.0,
      );

  //tickPaint.color = Colors.blueGrey;
  // final String clockText;

  double tickMarkLength;
  const angle = 2 * math.pi / 60;
  // final radius = size.width / 2;
  const hourTickMarkLength = 10.0;
  const minuteTickMarkLength = 5.0;
  const hourTickMarkWidth = 3.0;
  const minuteTickMarkWidth = 1.5;
  // drawing

  var currentTimeIndex =
      (DateTime.now().hour * 2.5 + DateTime.now().minute / 24).toInt();

  canvas.translate(size.width / 2, size.height / 2);
  for (var i = 0; i < 60; i++) {
    //make the length and stroke of the tick marker longer and thicker depending
    tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
    tickPaint.strokeWidth =
        i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;

    // show current time
    if (i <= currentTimeIndex) {
      tickPaint.color = Colors.blue;
    } else {
      tickPaint.color = Colors.black;
    }
    canvas.drawLine(Offset(0.0, -finalradius),
        Offset(0.0, -finalradius + tickMarkLength), tickPaint);

    //draw the text
    if (i % 5 == 0) {
      canvas.save();
      canvas.translate(0.0, -finalradius - 10.0);

      textPainter.text = TextSpan(
        text: '${i == 0 ? 12 * 2 : i ~/ 5 * 2}',
        style: textStyle,
      );

      //helps make the text painted vertically
      canvas.rotate(-angle * i);
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
      canvas.restore();
    }
    canvas.rotate(angle);
  }
}
