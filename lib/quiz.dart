// This class displays the question text along with the corresponding choices.
import 'package:basic_quiz_app/question.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions; // list of key value pairs containing question, choices and scores
  final int questionIndex;

  const Quiz({Key? key, required this.questions, required this.questionIndex, required this.answerQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String), // display the question text according to the index we are at
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answerMap) {
          // access the list of key value pairs containing the scores and MCQ option text. This is later mapped into a list of widgets
          // using the map method of list and spread operator to populate the column
          return Answer(
            selectHandler: (() => answerQuestion(answerMap["score"])), // Since we cannot pass a parameterized function to
            // selectHandler (it expects a void callback), we define an anonymous function to be assigned to select handler and in the body of this anonymous function,
            // we call the parameterised function with the required arguments. The anonymous function gets stored in the memory and bound to the event handler.
            // When this event happens, this function simply calls the required method and passes the necessary parameters.
            buttonText: answerMap["text"] as String,
          );
        })
        // Using questions list to access the list of answers for the current questionIndex and then mapping this list of answers to an answer widget to display the corresponding choices of the current question.
      ],
    );
  }
}
