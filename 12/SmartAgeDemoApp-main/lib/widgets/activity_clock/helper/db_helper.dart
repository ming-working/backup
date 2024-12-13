import 'dart:async';

import 'daily_activity.dart';

abstract class DbHelper {
  Future<List<DailyActivity>> getDailyActivities(String showDate);

  Future<List<DailyActivity>?> getHeartRate(String showDate);

  Future<void> close();
}
