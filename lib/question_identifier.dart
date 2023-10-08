import 'package:flutter/material.dart';

class Identifier extends StatelessWidget {
  const Identifier(
      {super.key, required this.questionsIndex, required this.isCorrect});

  final int questionsIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionsIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrect
              ? const Color.fromARGB(255, 87, 173, 254)
              : const Color.fromARGB(204, 255, 71, 117)),
      child: Text(
        questionNumber.toString(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
