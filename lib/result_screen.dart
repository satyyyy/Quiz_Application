import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': question[i].text,
          'correct_answer': question[i].answers[0],
          'selected_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final totalQues = question.length;
    final numCorrectQues = summaryData.where(
      (data) {
        return data['selected-answer'] == data['correct-answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQues out of $totalQues questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 228, 187, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummary()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Retart the quiz'),
            )
          ],
        ),
      ),
    );
  }
}
