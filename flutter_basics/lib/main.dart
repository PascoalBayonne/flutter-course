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
      'Question': 'Як буде магазин по-португалськи?',
      'Answers': [
        {'textQuestion': 'Loja', 'score': 10},
        {'textQuestion': 'Cama', 'score': 0},
        {'textQuestion': 'Mercado', 'score': 1}
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
      'Question': 'Що саме ми не купили в IKEA?',
      'Answers': [
        {'textQuestion': 'Aquecedor', 'score': 10},
        {'textQuestion': 'Cama', 'score': 0},
        {'textQuestion': 'Fronhas, toalhas e Lâmpadas', 'score': 0}
      ]
    },
    {
      'Question': 'Що таке Faca?',
      'Answers': [
        {'textQuestion': 'Ниж', 'score': 10},
        {'textQuestion': 'Ложка', 'score': 0},
        {'textQuestion': 'Подужка', 'score': 0}
      ]
    },
    {
      'Question': 'Що таке Cadeira?',
      'Answers': [
        {'textQuestion': 'Сітль', 'score': 0},
        {'textQuestion': 'Крисло', 'score': 10},
        {'textQuestion': 'Дзеркло', 'score': 0}
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
      'Question': 'Ми спимо в?',
      'Answers': [
        {'textQuestion': 'Cuarto', 'score': 10},
        {'textQuestion': 'Sala', 'score': 0},
        {'textQuestion': 'Quadrado', 'score': 0}
      ]
    },
    {
      'Question': 'Як буде чорний по-португалськи?',
      'Answers': [
        {'textQuestion': 'Perto', 'score': 0},
        {'textQuestion': 'Preto', 'score': 10},
        {'textQuestion': 'Pato', 'score': 0}
      ]
    },
    {
      'Question': 'Як буде \'Ласкаво просимo\' по-португалськи?',
      'Answers': [
        {'textQuestion': 'Vien-Venidos', 'score': 0},
        {'textQuestion': 'Feliz Festas', 'score': 0},
        {'textQuestion': 'Bem-vindo', 'score': 10}
      ]
    },
    {
      'Question': 'Як буде \'вчора\' по-португалськи? ?',
      'Answers': [
        {'textQuestion': 'Ontem', 'score': 10},
        {'textQuestion': 'Amanhã', 'score': 0},
        {'textQuestion': 'Hoje', 'score': 0}
      ]
    }
  ];

  var _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    //forces flutter to re(render) the UI. Not the all UI app but the widget that called the setState
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('the question index is: $_questionIndex ');
  }

  void _resetQuiz() {
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
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
                resetQuizHanlder: _resetQuiz,
                totalPoints: _totalScore,
              ),
        // backgroundColor: Color(00),
      ),
    );
  }
}
