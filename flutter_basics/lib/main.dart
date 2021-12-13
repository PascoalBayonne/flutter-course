import 'package:flutter/material.dart';
import 'package:flutter_basics/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = [
    {
      'Question': 'Як буде дорога по-португалськи?',
      'Answers': [
        {'textQuestion': 'Caminha', 'score': 1},
        {'textQuestion': 'Loja de cidadão', 'score': 0},
        {'textQuestion': 'Estrada', 'score': 10}
      ]
    },
    {
      'Question': 'Який колір нашої машини?',
      'Answers': [
        {'textQuestion': 'Cinzenta', 'score': 10},
        {'textQuestion': 'Branca', 'score': 0},
        {'textQuestion': 'Laranja', 'score': 0}
      ]
    },
    {
      'Question': 'Як буде Рожевий по-португалськи?',
      'Answers': [
        {'textQuestion': 'Cor de Prosa', 'score': 0},
        {'textQuestion': 'Cor de Rosa', 'score': 10},
        {'textQuestion': 'Cor de Laranja', 'score': 0}
      ]
    },
    {
      'Question': 'Як буде \'вчора\' по-португалськи? ?',
      'Answers': [
        {'textQuestion': 'Ontem', 'score': 10},
        {'textQuestion': 'Amanhã, Swift, NodeJs', 'score': 0},
        {'textQuestion': 'Hoje', 'score': 0}
      ]
    }
  ];

  var _questionIndex =
      0; // the "_" means that its a private field, so it cannot be changed outside (encapsulation)
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    print('============ Score: $_totalScore');
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }

    //forces flutter to re(render) the UI. Not the all UI app but the widget that called the setState
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('the question index is: $_questionIndex ');
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('iGo')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
              ),
        // backgroundColor: Color(00),
      ),
    );
  }
}
