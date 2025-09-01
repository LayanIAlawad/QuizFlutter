import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.selectAnswer, {super.key});

  final void Function(String answer) selectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var questionIndex = 0;

  void questionAnswer(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = question[questionIndex];
    return SizedBox(
        child: Container(
            margin: EdgeInsets.all(30),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.tiltNeon(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...currentQuestion.getShuffle().map((answer) {
                    return Answer(answer, () {
                      questionAnswer(answer);
                    });
                  })
                ]))));
  }
}
