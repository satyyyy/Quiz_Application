import 'package:flutter/material.dart';

// ignore: camel_case_types
class Start_screen extends StatelessWidget {
  const Start_screen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          const Text(
            'Learn Flutter the fun way!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: (30),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 300,
            child: OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text(
                'Start quiz',
              ),
              icon: const Icon(Icons.arrow_circle_right_outlined),
            ),
          )
        ],
      ),
    );
  }
}
