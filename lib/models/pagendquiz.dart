import 'package:flutter/material.dart';

class PagEndQuiz extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const PagEndQuiz({
    Key? key,
    required this.correctAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fine Quiz'),
      ),
      body: Center(
        child: Text('Congratulazioni, hai completato il quiz!\nRisposte corrette: $correctAnswers su $totalQuestions'),
      ),
    );
  }
}
