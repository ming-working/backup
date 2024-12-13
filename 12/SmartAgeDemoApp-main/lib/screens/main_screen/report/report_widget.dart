import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class LifeStyleWidget extends StatefulWidget {
  const LifeStyleWidget({Key? key}) : super(key: key);

  @override
  _LifeStyleWidgetState createState() => _LifeStyleWidgetState();
}

class _LifeStyleWidgetState extends State<LifeStyleWidget> {
  // String value = '長者七日生活狀況';
  String value = t.reportWidget.tWeekly;
  String breakfirst_time_seven_day = '8:30AM - 9:50AM';
  String breakfirst_time_a_month = '7:30AM - 9:30AM';
  String breakfirst_time_a_year = '7:30AM - 9:25AM';

  String breakfirst_time = '8:25AM - 9:30AM';
  String lunch_time_seven_day = '1:15PM - 3:00PM';
  String lunch_time_a_month = '11:55AM - 2:30PM';
  String lunch_time_a_year = '12:05PM - 2:05PM';
  String lunch_time = '12:00PM - 2PM';

  Future<dynamic> getData(DatabaseReference ref) async {
    var db = await ref.once();
    var returnValue;

    Map<dynamic, dynamic> values = db.snapshot.value as Map<dynamic, dynamic>;
    values.forEach((key, values) {
      if (key.toString() == "data number 0") {
        returnValue = values;
      }
    });

    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("QQQQQQQQQQQQQQQQQQQQQQQQ");
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('users_demo');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: smartAgeIconBgColor),
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // const Expanded(child: Text("生活習慣模式")),
                Expanded(child: Text(t.reportWidget.tLifestyle)),
                Expanded(
                  child: DropdownButton<String>(
                    value: value,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                      if (newValue == t.reportWidget.tWeekly) {
                        // if (newValue == "長者七日生活狀況") {
                        // Code for handling "長者七日生活狀況" option
                        setState(() {
                          breakfirst_time = breakfirst_time_seven_day;
                        });
                        setState(() {
                          lunch_time = lunch_time_seven_day;
                        });
                      } else if (newValue == t.reportWidget.tMonthly) {
                        // } else if (newValue == "長者一個月生活狀況") {
                        // Code for handling "長者一個月生活狀況" option
                        breakfirst_time = breakfirst_time_a_month;
                        setState(() {
                          lunch_time = lunch_time_a_month;
                        });
                      } else if (newValue == t.reportWidget.tYearly) {
                        // } else if (newValue == "長者一年生活狀況") {
                        // Code for handling "長者一年生活狀況" option
                        breakfirst_time = breakfirst_time_a_year;
                        setState(() {
                          lunch_time = lunch_time_a_year;
                        });
                      }
                    },
                    items: <String>[
                      t.reportWidget.tWeekly,
                      t.reportWidget.tMonthly,
                      t.reportWidget.tYearly,
                      // '長者七日生活狀況',
                      // '長者一個月生活狀況',
                      // '長者一年生活狀況',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10), // Add spacing between the images

        FutureBuilder(
            future: getData(ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var data = snapshot.data as Map<dynamic, dynamic>;

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: smartAgeIconBgColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${t.reportWidget.tMeal}"),
                              Image.asset('assets/icons/habit.png'),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/icons/meal_freq.png'),
                                Image.asset('assets/icons/b_peri.png'),
                                Image.asset('assets/icons/l_peri.png'),
                                Image.asset('assets/icons/d_peri.png'),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${t.reportWidget.tFreq} ${data['average_meals']}"),
                                // Text("用膳頻率: ${data['average_meals']}"),
                                Text(
                                    "${t.reportWidget.tBF} ${data['breakfast_start_time']} - ${data['breakfast_end_time']}"),
                                Text(
                                    "${t.reportWidget.tLunch}${data['lunch_start_time']} - ${data['lunch_end_time']}"),
                                Text(
                                    "${t.reportWidget.tDinner} ${data['dinner_start_time']} - ${data['dinner_end_time']}"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),

        const SizedBox(height: 10),

        FutureBuilder(
            future: getData(ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var data = snapshot.data as Map<dynamic, dynamic>;

                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: smartAgeIconBgColor,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.reportWidget.tSlp),
                              // Text("睡眠習慣及質量"),
                              Image.asset("assets/icons/sleep.png"),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/icons/wakeup.png"),
                                Image.asset("assets/icons/sleepTime.png"),
                                Image.asset("assets/icons/sleepy.png"),
                                Image.asset("assets/icons/tired.png"),
                                Image.asset("assets/icons/move.png"),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${t.reportWidget.tGetup} ${data['sleeping_end_time_1']} - ${data['sleeping_end_time_2']}"),
                                Text(
                                    "${t.reportWidget.tBed}  ${data['sleeping_start_time_1']} - ${data['sleeping_end_time_2']}"),
                                Text(
                                    "${t.reportWidget.tAvg} ${data['average_sleeping_time']}"),
                                Text("${t.reportWidget.tBodyMove} "),
                                Text(
                                    "${t.reportWidget.tNight}  ${data['night_time_toliet']}"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            })
      ],
    );
  }
}
