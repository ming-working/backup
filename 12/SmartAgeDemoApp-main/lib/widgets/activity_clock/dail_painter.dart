import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class DailPainter extends CustomPainter {
  //final clockText;

  final hourTickMarkLength = 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth = 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  final bool isCurrentTime;

  DailPainter(this.isCurrentTime)
      : tickPaint = Paint(),
        textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle = const TextStyle(
          color: Colors.black,
          fontFamily: 'Times New Roman',
          fontSize: 15.0,
        ) {
    tickPaint.color = Colors.blueGrey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double tickMarkLength;
    const angle = 2 * math.pi / 60;
    final radius = size.width / 2;
    var currentTime = DateTime.now();

    final pointerEnd = timeToLocation(currentTime, radius);

    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i < 60; i++) {
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
      tickPaint.strokeWidth =
          i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      // tickPaint.color = i % 5 == 0 ? Colors.red : Colors.blueGrey;
      canvas.drawLine(Offset(0.0, -radius),
          Offset(0.0, -radius + tickMarkLength), tickPaint);

      //draw the text
      if (i % 5 == 0) {
        canvas.save();
        canvas.translate(0.0, -radius - 15.0);

        textPainter.text = TextSpan(
          text: '${i == 0 ? 0 : i * 2 ~/ 5}',
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(canvas,
            Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }

      canvas.rotate(angle);
    }
    if (isCurrentTime) {
      canvas.drawCircle(const Offset(0, 0), 5, tickPaint);
      canvas.drawLine(const Offset(0, 0), pointerEnd, tickPaint);
    }

    canvas.restore();
  }

  Offset timeToLocation(DateTime dateTime, var radius) {
    double angle =
        ((dateTime.hour + dateTime.minute / 60) / 24) * 2 * pi - pi / 2;
    double x = cos(angle);
    double y = sin(angle);
    return Offset(x * radius * 0.85, y * radius * 0.85);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
