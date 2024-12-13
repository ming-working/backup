import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/i18n/strings.g.dart';
import 'package:smartage_care/widgets/activity_clock/helper/daily_activity.dart';

var detectRange = 10;

class ClockToast {
  bool show = false;

  void getTapMessage(var x, var y, var clockRadius,
      List<DailyActivity> activityList, var areas, bool isCurrent) {
    show = true;
    // Calculate the angle to +y axis in radius
    var angle = atan2(y, x) + pi / 2;
    // Convert angle to hours
    double hours = angle * 12 / pi;
    // Convert hours to clock time format
    int hour = (hours % 24).floor();
    int minute = ((hours % 1) * 60).floor();

    double radius = sqrt(pow(x, 2) + pow(y, 2));

    var n = 0;
    var r = smartAgeClockStrokeWidth;

    if (radius < clockRadius * smartAgeClockRatio1 + r / 2 &&
        radius > clockRadius * smartAgeClockRatio1 - r / 2) {
      n = 1;
    } else if (radius < clockRadius * smartAgeClockRatio2 + r / 2 &&
        radius > clockRadius * smartAgeClockRatio2 - r / 2) {
      n = 2;
    } else if (radius < clockRadius * smartAgeClockRatio3 + r / 2 &&
        radius > clockRadius * smartAgeClockRatio3 - r / 2) {
      n = 3;
    } else {
      show = false;
    }

    var activity =
        findActivity(hour, minute, areas[n], activityList, isCurrent);

    if (show) {
      var area = getCNArea(areas[n]);
      var message = '$activity  $area';
      // '$activity  ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}  ${tRooms[n]}';
      showToast(message);
    } else {
      hideToast();
    }
  }

  String findActivity(int hour, int minute, String area,
      List<DailyActivity> activityList, bool isCurrent) {
    final list =
        activityList.where((activity) => activity.area == area).toList();
    final currentTime = DateTime.now();

    for (var element in list) {
      // date: [hour, minute, activityMinutes]
      var time = element.getTime();

      if (isCurrent) {
        if (time[0] > currentTime.hour ||
            (time[0] == currentTime.hour && time[1] > currentTime.minute)) {
          continue;
        }
      }

      // Expand Tap recognition range
      var startRange = [time[0], time[1] - detectRange];
      var endRange = (time[1] + time[2] >= 60 - detectRange)
          ? [time[0] + 1, time[1] + time[2] - 60 + detectRange]
          : [time[0], time[1] + time[2] + detectRange];

      if (hour > endRange[0] || hour < startRange[0]) {
        continue;
      }
      if (startRange[0] == endRange[0]) {
        if (hour == startRange[0] &&
            minute > startRange[1] &&
            minute < endRange[1]) {
          return element.time;
        }
      } else if ( // startTime hour < endTime hour
          (hour == startRange[0] && minute > startRange[1]) ||
              hour == endRange[0] && minute < endRange[1]) {
        return element.time;
      }
    }
    show = false;
    return 'no activity';
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: smartAgeDarkGreyColor,
        textColor: grey000,
        fontSize: 16.0);
  }

  void hideToast() {
    Fluttertoast.cancel();
  }

  String getCNArea(String area) {
    for (int i = 0; i < smartAgeRooms.length; i++) {
      if (smartAgeRooms[i] == area) {
        return t.mainScreen.tCNRooms[i];
      }
    }
    return 'none';
  }
}
