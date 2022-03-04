import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.buttonFunction,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback buttonFunction;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: buttonFunction,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
