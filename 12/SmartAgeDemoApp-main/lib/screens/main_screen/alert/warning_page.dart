import 'package:flutter/material.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/screens/main_screen/questionnaire/questionnaire_page.dart';
import 'package:smartage_care/screens/main_screen/alert/warning_box_widget.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/image_strings.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class WarningPage extends StatefulWidget {
  const WarningPage({super.key});
  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; //Dark mode

    return SafeArea(
      child: Scaffold(
          //appBar: SimpleAppBar(),
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(5),
                height: 40,
                color: smartAgeWarningColor,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    smartAgeSignalImage,
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    t.warningScreen.tWarningTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ])),
            SizedBox(height: 10),
            SizedBox(
              height: 350,
              child: ListView.separated(
                // padding: const EdgeInsets.all(8),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: WarningBox(index: index),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: smartAgeWhite,
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                            onPressed: () {
                              if (index == 0) {
                                setState(() {
                                  _contactElderly(context);
                                });
                              }
                              if (index == 1) {
                                // showQuestionnaire();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          QuestionnairePage()),
                                );
                              }
                            },
                            // child: (index == 0)
                            //     ? const Text('聯絡長者')
                            //     : const Text('立即處理'),
                            child: (index == 0)
                                ? Text(t.warningScreen.tContactElderly)
                                : Text(t.warningScreen.tSettleNow),
                          ),
                          SizedBox(width: 30),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: smartAgeWhite,
                                backgroundColor: smartAgeGreyColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                            onPressed: () {},
                            // child: Text('稍後處理'),
                            child: Text(t.warningScreen.tRemind),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(children: [
                Expanded(
                  child: Container(
                    color: Color(0xFFF7E2DE),
                    // child: Text("爸爸的支援圈成員"),
                    child: Text(t.warningScreen.tSupport),
                  ),
                )
              ]),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jason Or （" + t.circleOfSupportScreen.tCoSLeader + "）",
                      style: TextStyle(
                          // fontFamily: GoogleFonts.mulish().fontFamily,
                          fontWeight: FontWeight.w900)),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: smartAgeWhite,
                    ),
                    onPressed: () {},
                    child: Text(t.mainScreen.iconText.tCall),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    color: Color(0xFFF7E2DE),
                    // child: Text("長者鄰舍/活動中心的職員"),
                    child: Text(t.warningScreen.tLoc),
                  ),
                )
              ]),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("陳姑娘 （負責職員）",
                  Text(t.warningScreen.tMs,
                      style: TextStyle(
                          // fontFamily: GoogleFonts.mulish().fontFamily,
                          fontWeight: FontWeight.w900)),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: smartAgeWhite,
                    ),
                    onPressed: () {},
                    child: Text(
                      t.mainScreen.iconText.tCall,
                    ),
                  ),
                ],
              ),
            ]),
          ]),
        ),
      )

          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  Future<void> _contactElderly(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              // '請立即聯絡爸爸，確保安全',
              // 'Contact Elderly immediately to ensure safety',
              t.warningScreen.tSave,
            ),
          );
        });
  }

  // the pop out window to show question form
  Future<bool?> showQuestionnaire() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0,
            backgroundColor: smartAgeWhite,
            child: Container(
              width: 350,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(tFormTitle,
                      style: TextStyle(
                        fontSize: 16,
                      )), //title

                  // QuestionFormWidget(), // body part

                  Row(
                    // bottom part
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 20)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            tCancel,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: smartAgePrimaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          onPressed: () {},
                          child: Text(
                            t.warningScreen.tCallIme,
                            style: TextStyle(
                                color: smartAgeWhite,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
