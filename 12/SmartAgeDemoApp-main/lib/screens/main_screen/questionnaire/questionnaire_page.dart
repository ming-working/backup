import 'package:flutter/material.dart';
import 'package:smartage_care/screens/main_screen/questionnaire/widgets/appbar.dart';

import 'widgets/questionnaire_widget.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: SimpleAppBar(),
        body: QuestionnaireWidget(),
      ),
    );
  }
}
