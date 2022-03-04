import 'package:basic_quiz_app/question.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  const Quiz({Key? key, required this.questions, required this.questionIndex, required this.answerQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answerMap) {
          return Answer(
            selectHandler: (() => answerQuestion(answerMap["score"])),
            buttonText: answerMap["text"] as String,
          );
        })
        // Using questions list to access the list of answers for the current questionIndex and then mapping this list of answers to an answer widget to display the corresponding choices of the current question.
      ],
    );
  }
}
