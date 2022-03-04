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
    //print(_questionIndex);
  }

  void _resetQuiz() => setState(() => _totalScore = _questionIndex = 0);

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
        //const Text("Over"),
      ),
    );
  }
}
