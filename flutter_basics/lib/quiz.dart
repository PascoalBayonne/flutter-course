import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final VoidCallback answerFunction; //could use function
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['Question'] as String,
        ),
        ...(questions[questionIndex]['Answers'] as List<String>).map((answer) {
          return Answer(answerFunction, answer);
        }).toList()
      ],
    );
  }
}
