import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:smartage_care/widgets/activity_clock/helper/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'daily_activity.dart';
import 'package:path_provider/path_provider.dart';

class DbHelperLocal extends DbHelper {
  static Database? _db;
  static final DbHelperLocal instance = DbHelperLocal._init();
  DbHelperLocal._init();

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDB('elderlyDB.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    //final dbPath = await getDatabasesPath();
    //final path = join(dbPath, filePath);
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();
    //final dbPath =  await getDatabasesPath();
    String elderlyDBPath = path.join(applicationDirectory.path, filePath);

    bool dbExistsElderly = await io.File(elderlyDBPath).exists();

    if (!dbExistsElderly) {
      // Copy from asset
      String sourcePath = path.join("assets/db", filePath);
      ByteData data = await rootBundle.load(sourcePath);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(elderlyDBPath).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(elderlyDBPath);
  }

  @override
  Future<List<DailyActivity>> getDailyActivities(String showDate) async {
    final db = await instance.database;
    debugPrint('showDate: $showDate');

    final List<Map<String, dynamic>> maps = await db
        .query('DailyActivity', where: '"Date" = ?', whereArgs: [showDate]);

    //final List<Map<String, dynamic>> maps = await db.query('DailyActivity',
    //  where: '"Date" = "7/13/2024"', whereArgs: [showDate]);
    debugPrint('maps: $maps');

    return List.generate(
      maps.length,
      (i) {
        return DailyActivity(
            activityMinutes: maps[i]['ActivityMinutes'] ?? 0,
            area: maps[i]['Areas'],
            date: maps[i]['Date'],
            time: maps[i]['Time']);
      },
    );
  }

  //TODO: edit the data format
  @override
  Future<List<DailyActivity>> getHeartRate(String showDate) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query('HeartRate', where: '"Date" = ?', whereArgs: [showDate]);

    return List.generate(maps.length, (i) {
      return DailyActivity(
          activityMinutes: maps[i]['ActivityMinutes'] ?? 0,
          area: maps[i]['Areas'],
          date: maps[i]['Date'],
          time: maps[i]['Time']);
    });
  }

  @override
  Future<void> close() async {
    //final db = await instance.database;

    _db?.close();
  }
}
