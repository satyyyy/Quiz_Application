import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/result_screen.dart';

class Quiz extends StatefulWidget {
  @override
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = Start_screen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 92, 0, 172),
                Color.fromARGB(255, 92, 0, 172),
                Color.fromARGB(255, 92, 0, 172),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
