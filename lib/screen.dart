import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            " FLUTTER TEST",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              icon: Icon(
                Icons.access_alarm,
                size: 25,
                color: Colors.white,
              ),
              label: Text(
                "Start quiz",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
