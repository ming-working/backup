import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stroke_text/stroke_text.dart';

import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/constants/text_strings.dart';
import 'package:smartage_care/screens/main_screen/alert/warning_page.dart';
import 'package:smartage_care/screens/main_screen/circle_of_support/circle_of_support_screen.dart';
//import 'package:smartage_care/src/features/core/screens/chat/chat_list_page.dart';
import 'question_entity.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class QuestionnaireWidget extends StatefulWidget {
  const QuestionnaireWidget({
    super.key,
  });

  @override
  State<QuestionnaireWidget> createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends State<QuestionnaireWidget> {
  String tQuestionType = 'Nocturia';
  String tButtonText = 'Contact Elderly';
  // String tQuestionType = '夜尿頻繁';
  // String tButtonText = '聯絡長者';
  final questionList =
      QuestionEntityList().questionList; // to get the question & answers pairs
  late final _count =
      questionList.length; // number of questions in question list
  var selectedOptions = []; // store which radio button is selected

  @override
  void initState() {
    super.initState();
    initSelectedOptions(selectedOptions, _count);
  }

  void initSelectedOptions(var selectedOptions, var count) {
    for (var i = 0; i < count; i++) {
      selectedOptions.add(-1);
    }
  }

  bool _checkCompleted() {
    for (int i = 0; i < selectedOptions.length; i++) {
      if (selectedOptions[i] == -1) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: smartAgeDefaultSize, right: smartAgeDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              StrokeText(
                text: t.Question.tQuestionnaire + t.Question.tQuestionType[0],
                // text: '問卷：' + tQuestionType,
                textColor: smartAgeWhite,
                strokeWidth: 4,
                strokeColor: smartAgeBlack,
                textStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // create the question list

          Expanded(
            child: ListView.builder(
              itemCount: _count,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question part
                  /*Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey[200],
                    child: */
                  Text(
                    '${index + 1}. ${questionList[index].question}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ),
                  // Answer list part
                  Container(
                    // padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        for (int j = 0;
                            j < questionList[index].answers.length;
                            j += 2)
                          Row(
                            children: [
                              for (int a = 0;
                                  a < 2 &&
                                      j + a <
                                          questionList[index].answers.length;
                                  a++)
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text(
                                        questionList[index].answers[j + a]),
                                    value: j + a,
                                    groupValue: selectedOptions[index] == (-1)
                                        ? null
                                        : selectedOptions[index],
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedOptions[index] = value;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          // the bottom button
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Color.fromRGBO(6, 32, 169, 1),
          //   ),
          //   onPressed: () {},
          //   child: const Text('聯絡長者'),
          // ),
          Center(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: smartAgeWhite,
                  backgroundColor: Color.fromRGBO(6, 32, 169, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
              onPressed: () {
                if (tButtonText != tCompleteText) {
                  setState(() {
                    tButtonText = tCompleteText;
                    _contactElderly(context);
                  });
                } else {
                  _checkCompleted()
                      ? _leaveThisPage(context)
                      : _oopsNotCompleted(context);
                }
              },
              child: Text(t.Question.tButtonText),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

Future<void> _contactElderly(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.Question.tContacted),
          content: Text(t.Question.tAskFill),
          // title: Text('已聯絡長者！'),
          // content: Text('請您現在填寫問卷'),
        );
      });
}

Future<void> _oopsNotCompleted(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(t.Question.tEmpty),
        );
      });
}

Future<void> _leaveThisPage(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.Question.tDone),
          content: Text(t.Question.tIfNurse),
          // title: Text('問卷已填寫！'),
          // content: Text('請問您需要護士諮詢服務嗎？'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey.shade700,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.back();
                    // Navigator.of(context).pop();
                  },
                  child: Text(t.Question.tNotNow),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: smartAgeWhite,
                      backgroundColor: smartAgePrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () async {
                    // Get.close(times)
                    Navigator.pop(context);

                    await Get.to(() => const CircleOfSupportScreen());
                    Get.back();
                    // TODO: how to fix the problem ?
                    // SOLUTION: IDK
                    if (!context.mounted) return;
                  },
                  child: Text(t.Question.tContact),
                ),
              ],
            )
          ],
        );
      });
}
