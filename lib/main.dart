import 'package:basic_quiz_app/question_data.dart';
import 'package:basic_quiz_app/quiz.dart';
import 'package:basic_quiz_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = questions; // map for storing MCQs and their choices given to user
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    //Increment the question index to change the question and options shown on the screen
  }

  void _resetQuiz() => setState(() => _totalScore = _questionIndex = 0); // reset index and score to 0 and rebuild the corresponding widgets using setState

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestions,
              )
            : Result(
                score: _totalScore,
                resetQuiz: _resetQuiz,
              ),
        // Ternary operator to choose between the quiz widget and the result widget depending on the value of the quiz index
        //const Text("Over"),
      ),
    );
  }
}
