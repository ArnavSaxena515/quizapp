import 'package:basic_quiz_app/common_button.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

//Simple button that upon being pressed, shares the results of the user's quiz attempt to other apps using the share_plus package.
class ShareResult extends StatelessWidget {
  final int score;
  final String resultText;

  const ShareResult({required this.resultText, required this.score, Key? key}) : super(key: key);

  void shareResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share('check out my personality result: \nScore: $score\nVerdict:$resultText', sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  } // Uses the android native intent to share the text in some other apps

  @override
  Widget build(BuildContext context) {
    return CommonButton(buttonFunction: (() => shareResult(context)), buttonText: 'Share Result');
  }
}
