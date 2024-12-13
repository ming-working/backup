//import 'package:smartage_care/src/features/core/screens/warning/questionnaire/widgets/question_text.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class QuestionEntity {
  String question;
  List<String> answers;

  QuestionEntity(
    this.question,
    this.answers,
  );
}

class QuestionEntityList {
  late List<QuestionEntity> questionList = [];

  QuestionEntityList() {
    questionList
        .add(QuestionEntity(t.Question.tQuestion1, t.Question.tAnswer1));
    questionList
        .add(QuestionEntity(t.Question.tQuestion2, t.Question.tAnswer2));
    questionList
        .add(QuestionEntity(t.Question.tQuestion3, t.Question.tAnswer3));
    questionList
        .add(QuestionEntity(t.Question.tQuestion4, t.Question.tAnswer4));
    questionList
        .add(QuestionEntity(t.Question.tQuestion5, t.Question.tAnswer5));
  }
}
