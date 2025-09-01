import 'package:flutter/material.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/screen.dart';
import 'package:quiz/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> listAnswers = [];
  var active = 'Start Screen';
  void changeScreen() {
    setState(() {
      active = 'Question Screen';
    });
  }

  void chooseAnswer(String answer) {
    listAnswers.add(answer);
    if (listAnswers.length == question.length) {
      setState(() {
        active = 'Result Screen';
      });
    } else {
      setState(() {});
    }
  }

  void restartQuiz() {
    setState(() {
      listAnswers = [];
      active = 'Question Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Screen(changeScreen);
    if (active == 'Question Screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }
    if (active == "Result Screen") {
      screenWidget = Results(listAnswers, restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 59, 96, 148),
              const Color.fromRGBO(69, 134, 177, 1)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
