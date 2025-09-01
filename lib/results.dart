import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questions.dart';

class Results extends StatelessWidget {
  const Results(this.chooseAnswer, this.restart, {super.key});
  final List<String> chooseAnswer;

  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "correct_answer": question[i].answers[0],
        "user_answer": chooseAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final totalQuestion = question.length;
    final numCorrect = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $numCorrect out of $totalQuestion questions correctly!!",
                style: GoogleFonts.tiltNeon(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Summary(getSummary()),
              SizedBox(height: 50),
              TextButton.icon(
                  onPressed: restart,
                  icon: Icon(Icons.refresh, size: 25, color: Colors.white),
                  label: Text(
                    "Restart Quiz",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ));
  }
}

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            const Color.fromARGB(99, 164, 196, 244),
                        child: Text(
                            ((data["question_index"] as int) + 1).toString(),
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white))),
                    Expanded(
                      child: Column(
                        children: [
                          Text(data["correct_answer"] as String,
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          Text(data["user_answer"] as String,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 193, 213, 230),
                                  fontSize: 20)),
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ));
  }
}
