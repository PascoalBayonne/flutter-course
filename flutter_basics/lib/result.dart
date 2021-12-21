import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuizHanlder;
  final int totalPoints;
  Result(
      {@required this.resultScore,
      @required this.resetQuizHanlder,
      this.totalPoints});

  String get resultPhrase {
    String resultText = 'Muito bem! Ти чудова';
    if (resultScore >= 20 && resultScore <= 30) {
      resultText = 'Nada mal, Ну так собі!';
    } else if (resultScore >= 30 && resultScore <= 90) {
      resultText = 'Quase perfeito. Иайже йдеально';
    } else if (resultScore <= 20) {
      resultText = 'Muito mal! Дуже погано!';
    } else {
      resultText = 'Ідеально! Muito bem Bravo';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuizHanlder,
            child: Text('Restart Quiz'),
            color: Colors.blue,
          ),
          Text(
            'Total points: $totalPoints',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
