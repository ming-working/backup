import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/widgets/activity_clock/helper/db_helper.dart';
import 'package:smartage_care/widgets/activity_clock/helper/dail_painter.dart';
import 'package:smartage_care/widgets/activity_clock/helper/segment_painter.dart';
import 'package:smartage_care/widgets/activity_clock/helper/daily_activity.dart';
import 'package:flutter/material.dart';
import 'package:smartage_care/widgets/activity_clock/helper/db_helper_local.dart';
import 'package:intl/intl.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class ActivityClockSample extends StatefulWidget {
  final bool isNormalDate;

  const ActivityClockSample({super.key, required this.isNormalDate});

  @override
  State<ActivityClockSample> createState() => _ActivityClockSampleState();
}

class _ActivityClockSampleState extends State<ActivityClockSample> {
  bool isLoading = false; // to check if the activity data complete loading

  String? _selectedRoom1 = t.mainScreen.tCNRooms[1];
  String? _selectedRoom2 = t.mainScreen.tCNRooms[2];
  String? _selectedRoom3 = t.mainScreen.tCNRooms[3];
  String? _area1 = smartAgeRooms[1];
  String? _area2 = smartAgeRooms[2];
  String? _area3 = smartAgeRooms[3];
  String tEmpty = smartAgeRooms[0];

  List<DateTime> dates = [
    DateTime(2024, 1, 1),
    DateTime(2024, 1, 2)
  ]; // data analysis's date

  late final DbHelper dbHelper;
  List<DailyActivity> _noramlActivityList = [];
  List<DailyActivity> _abnoramlActivityList = [];

  Future<void> _fetchActivities() async {
    final normalDateTime = DateFormat('M/d/yyyy').format(dates[0]);
    final abnormalDateTime = DateFormat('M/d/yyyy').format(dates[1]);
    final noramlActivityList =
        await dbHelper.getDailyActivities(normalDateTime);
    final abnoramlActivityList =
        await dbHelper.getDailyActivities(abnormalDateTime);
    setState(() {
      _noramlActivityList = noramlActivityList;
      _abnoramlActivityList = abnoramlActivityList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelperLocal.instance;
    _fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    // bool isActivity = false;
    final clockRadius = MediaQuery.of(context).size.width * 0.75 / 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //the main body of the activity clock
        //DONE: customize the number of ring displayed
        clockBody(context, clockRadius),

        //select the location of each ring
        locationSelector(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  SizedBox clockBody(BuildContext context, double clockRadius) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width - 50,
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 3,
        // clipBehavior: Clip.none,
        child: Stack(children: [
          Center(
            child: CustomPaint(
              painter: SegmentPainter(
                isCurrentTime: false,
                radius: clockRadius * smartAgeClockRatio1,
                area: _area1 ?? "",
                activityList: widget.isNormalDate
                    ? _noramlActivityList
                    : _abnoramlActivityList,
                rcolor: clockColors[0],
              ),
            ),
          ),
          Center(
            child: _selectedRoom2 == tEmpty
                ? null
                : CustomPaint(
                    painter: SegmentPainter(
                    isCurrentTime: false,
                    radius: clockRadius *
                        (_selectedRoom3 == tEmpty
                            ? smartAgeClockRatio_
                            : smartAgeClockRatio2),
                    area: _area2 ?? "",
                    activityList: widget.isNormalDate
                        ? _noramlActivityList
                        : _abnoramlActivityList,
                    rcolor: clockColors[1],
                  )),
          ),
          Center(
            child: _selectedRoom3 == tEmpty
                ? null
                : CustomPaint(
                    painter: SegmentPainter(
                    isCurrentTime: false,
                    radius: clockRadius *
                        (_selectedRoom2 == tEmpty
                            ? smartAgeClockRatio_
                            : smartAgeClockRatio3),
                    area: _area3 ?? "",
                    activityList: widget.isNormalDate
                        ? _noramlActivityList
                        : _abnoramlActivityList,
                    rcolor: clockColors[2],
                  )),
          ),
          //paint the dail and pointer
          Center(
            child: SizedBox(
              width: clockRadius * 2,
              height: clockRadius * 2,
              child: CustomPaint(painter: DailPainter(false)),
            ),
          ),
        ]),
      ),
    );
  }

  Row locationSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: _selectedRoom1,
          items: t.mainScreen.tCNRooms.map((String room) {
            return DropdownMenuItem<String>(
              value: room,
              child: Text(
                room,
                style: TextStyle(color: clockColors[0], fontSize: 18),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedRoom1 = value;
              for (int i = 0; i < t.mainScreen.tCNRooms.length; i++) {
                if (t.mainScreen.tCNRooms[i] == value) {
                  _area1 = smartAgeRooms[i];
                }
              }
            });
          },
        ),
        DropdownButton<String>(
          value: _selectedRoom2,
          items: t.mainScreen.tCNRooms.map((String room) {
            return DropdownMenuItem<String>(
              value: room,
              child: Text(
                room,
                style: TextStyle(color: clockColors[1], fontSize: 18),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedRoom2 = value;
              for (int i = 0; i < t.mainScreen.tCNRooms.length; i++) {
                if (t.mainScreen.tCNRooms[i] == value) {
                  _area2 = smartAgeRooms[i];
                }
              }
            });
          },
        ),
        DropdownButton<String>(
          value: _selectedRoom3,
          items: t.mainScreen.tCNRooms.map((String room) {
            return DropdownMenuItem<String>(
              value: room,
              child: Text(
                room,
                style: TextStyle(color: clockColors[2], fontSize: 18),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedRoom3 = value;
              for (int i = 0; i < t.mainScreen.tCNRooms.length; i++) {
                if (t.mainScreen.tCNRooms[i] == value) {
                  _area3 = smartAgeRooms[i];
                }
              }
            });
          },
        ),
      ],
    );
  }
}
