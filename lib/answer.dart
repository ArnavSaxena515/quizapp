import 'package:flutter/material.dart';

//widget designed to display various options associated with a question
class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String buttonText;

  const Answer({Key? key, required this.selectHandler, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: ElevatedButton(
        //color: Colors.blue,
        onPressed: selectHandler,
        child: Text(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
