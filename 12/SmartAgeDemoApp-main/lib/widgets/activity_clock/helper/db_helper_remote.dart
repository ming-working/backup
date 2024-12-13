import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:smartage_care/widgets/activity_clock/helper/db_helper.dart';
import 'daily_activity.dart';

class DbHelperRemote extends DbHelper {
  static CollectionReference? _db;
  static final DbHelperRemote instance = DbHelperRemote._init();
  DbHelperRemote._init();

  Future<dynamic> get database async {
    if (_db != null) return _db!;

    _db = await _initDB('Activities_grouped_kk');
    return _db!;
  }

  get firestore => null;

  Future<dynamic> _initDB(String filePath) async {
    CollectionReference activities = firestore.collection(filePath);

    return activities;
  }

  @override
  Future<List<DailyActivity>> getDailyActivities(String showDate) async {
    DateTime parsedShowDate = DateFormat('M/d/yyyy').parse(showDate);

    final CollectionReference db = await instance.database;
    QuerySnapshot querySnapshot = await db
        .where(
          'Start',
          isGreaterThanOrEqualTo:
              DateFormat('yyyy-MM-dd').format(parsedShowDate),
          isLessThan: DateFormat('yyyy-MM-dd')
              .format(parsedShowDate.add(const Duration(days: 1))),
        )
        .get();

    return querySnapshot.docs
        .map((doc) => DailyActivity(
            activityMinutes: _getDuration(doc['Start'], doc['Finish']),
            area: doc['Areas'],
            date: _getDate(doc['Start']),
            time: _getTime(doc['Start'])))
        .toList();
  }

  String _getDate(String dateString) {
    final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    return DateFormat('M/d/yyyy').format(date);
  }

  String _getTime(String dateString) {
    final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    return DateFormat('HH:mm').format(date);
  }

  int _getDuration(String startString, String endString) {
    final start = DateFormat("yyyy-MM-dd HH:mm:ss").parse(startString);
    final end = DateFormat("yyyy-MM-dd HH:mm:ss").parse(endString);
    final duration = end.difference(start).inMinutes;
    return duration;
  }

  @override
  Future<List<DailyActivity>?> getHeartRate(String showDate) async {
    return null;
  }

  @override
  Future<void> close() async {
    //final db = await instance.database;

    // _db?.close();
  }
}
