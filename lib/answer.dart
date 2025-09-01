import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answer, this.onTap, {super.key});

  final String answer;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(answer));
  }
}
