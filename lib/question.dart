//Simple widget designed to display the question text passed to it during instantiation.

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;
  const Question(this._question, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        _question,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
