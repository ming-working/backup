/*
  - This is hard-coded. Need to fetch the data from Cloud.
  - Not ready yet
*/

import 'dart:core';
import 'package:smartage_care/models/user.dart';

class CircleModel {
  final String elderlyName;
  List<SmartAgeUserModel> members = [];

  CircleModel(this.elderlyName, this.members);
}
