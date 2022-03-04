import 'package:basic_quiz_app/share_result.dart';
import 'package:flutter/material.dart';

import 'common_button.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  const Result({Key? key, required this.score, required this.resetQuiz}) : super(key: key);

  String get resultText {
    String text = "";
    if (score < 5) {
      text = "You're all sunshines and rainbows";
    } else if (score < 15) {
      text = "You're a positive person";
    } else if (score < 25) {
      text = "Damn that's some dark shit";
    } else {
      text = "Hello darkness my old friend";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: AlertDialog(
        backgroundColor: Colors.blueAccent,
        title: const Center(
            child: Text(
          "Quiz Finished",
          style: TextStyle(color: Colors.white),
        )),
        content: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YOUR SCORE: $score\n",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                resultText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonButton(
                      buttonFunction: resetQuiz,
                      buttonText: "Reset Quiz",
                    ),
                    ShareResult(
                      resultText: resultText,
                      score: score,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
