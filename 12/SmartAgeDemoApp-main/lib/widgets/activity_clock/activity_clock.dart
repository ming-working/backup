/*
  Somebody before me has written this code.
  So that only that person and GOD might know what is going on with the code.

  I am not the author of this code. I am just a messenger.

  Please GOD help me to understand this code and this code to work with no problem.
*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/text_strings.dart';

import 'activity_toast.dart';
import 'helper/db_helper.dart';
import 'helper/db_helper_local.dart';
import 'helper/daily_activity.dart';
import 'dail_painter.dart';
import 'segment_painter.dart';

class ActivityClock extends StatefulWidget {
  const ActivityClock({super.key});

  @override
  State<ActivityClock> createState() => _ActivityClockState();
}

class _ActivityClockState extends State<ActivityClock> {
  // double _angle = 0; // for rotation gesture
  bool isLoading = false; // to check if the activity data complete loading
  bool _isCurrentTime = true; // ?

  DateTime currentDate = DateTime.now(); // get current Date
  DateTime _selectedDate = DateTime.now(); // get selected Date
  DateTime _selectedDate_db = DateTime.now(); // get selected Date

  String currentPrimaryLocale = Get.locale.toString();
  // String? currentRegionLocale = LocaleSettings.currentLocale.countryCode;
  String currentFullLocale = "${Get.locale}";
  DateTime adjustDate(DateTime date) {
    if (date.month == 8) {
      return DateTime(date.year, date.month - 3, date.day);
    }
    if (date.month == 9) {
      return DateTime(date.year, 7, date.day);
    }
    if (date.month == 10) {
      return DateTime(date.year, 6, date.day);
    }
    return date;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(
        2023,
        6,
        1,
      ),
      // this can be hardcoded and should be obtained from cloud
      lastDate: DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
      ),
      // locale: Get.locale,
    );
    if (picked != null && picked != _selectedDate) {
      bool isSameDay = picked.year == currentDate.year &&
          picked.month == currentDate.month &&
          picked.day == currentDate.day;
      setState(() {
        isLoading = true;
        _selectedDate = picked;
        _isCurrentTime = isSameDay;
      });
      debugPrint('Selected Date: $_selectedDate');
      _selectedDate_db = adjustDate(_selectedDate);
      _fetchActivities();
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (timer) {
        setState(() {});
      },
    );

    // TODO: Need to implement the remote database and implementation of methodology to fetch the data from the cloud.
    dbHelper = DbHelperLocal.instance;
    // dbHelper = DbHelperRemote.instance;
    _fetchActivities();
  }

  final String _selectedRoom1 = 'dashBoardActivityClockBedroom'.tr;
  final String _selectedRoom2 = 'dashBoardActivityClockBathroom'.tr;
  final String _selectedRoom3 = 'dashBoardActivityClockKitchen'.tr;
  String tEmpty = smartAgeRooms[0];
  final String _area1 = smartAgeRooms[1];
  final String _area2 = smartAgeRooms[2];
  final String _area3 = smartAgeRooms[3];

  late final DbHelper dbHelper;
  List<DailyActivity> _activityList = [];
  late Timer _timer;
  Future<void> _fetchActivities() async {
    final showDate = DateFormat('M/d/yyyy').format(_selectedDate_db);
    final activityList = await dbHelper.getDailyActivities(showDate);
    isLoading = false;
    _activityList = activityList;
    debugPrint('Activity List: $_activityList');
    // setState(
    //   () {},
    // );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer before disposing the State object
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isActivity = false;
    final clockRadius = MediaQuery.of(context).size.width * (3 / 8);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // date selector to choose the date to display the activities
        dateSelector(context),
        //the main body of the activity clock
        //DONE: customize the number of ring displayed
        clockBody(context, clockRadius),
        //select the location of each ring
        locationSelector(),
      ],
    );
  }

  Row dateSelector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text('✓')),
        const SizedBox(
          width: 10,
        ),
        Text.rich(
          TextSpan(
              text: DateFormat('EEEE, d/M/yyyy').format(_selectedDate),
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Action to perform when the link is clicked
                  _selectDate(context);
                }),
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
                isCurrentTime: _isCurrentTime,
                radius: clockRadius * 0.9,
                area: _area1,
                activityList: _activityList,
                rcolor: clockColors[0],
              ),
            ),
          ),
          Center(
            child: _selectedRoom2 == tEmpty
                ? null
                : CustomPaint(
                    painter: SegmentPainter(
                    isCurrentTime: _isCurrentTime,
                    radius: clockRadius *
                        (_selectedRoom3 == tEmpty
                            ? smartAgeClockRatio_
                            : smartAgeClockRatio2),
                    area: _area2,
                    activityList: _activityList,
                    rcolor: clockColors[1],
                  )),
          ),
          Center(
            child: _selectedRoom3 == tEmpty
                ? null
                : CustomPaint(
                    painter: SegmentPainter(
                    isCurrentTime: _isCurrentTime,
                    radius: clockRadius *
                        (_selectedRoom2 == tEmpty
                            ? smartAgeClockRatio_
                            : smartAgeClockRatio3),
                    area: _area3,
                    activityList: _activityList,
                    rcolor: clockColors[2],
                  )),
          ),
          //paint the dail and pointer
          // Center(
          //   child: SizedBox(
          //     width: clockRadius * 2,
          //     height: clockRadius * 2,
          //     child: CustomPaint(painter: DailPainter(_isCurrentTime)),
          //   ),
          // ),
          //TODO: implement onTap show activity details
          Center(
            child: GestureDetector(
              onTapDown: (details) {
                // Use clock center as (0, 0)
                var x = details.localPosition.dx - clockRadius;
                var y = details.localPosition.dy - clockRadius;
                ClockToast().getTapMessage(x, y, clockRadius, _activityList,
                    [tEmpty, _area1, _area2, _area3], _isCurrentTime);
              },
              child: SizedBox(
                width: clockRadius * 2,
                height: clockRadius * 2,
                child: CustomPaint(painter: DailPainter(_isCurrentTime)),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Row locationSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          _selectedRoom1,
          style: GoogleFonts.poppins(
            color: clockColors[0],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          _selectedRoom2,
          style: GoogleFonts.poppins(
            color: clockColors[1],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          _selectedRoom3,
          style: GoogleFonts.poppins(
            color: clockColors[2],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
