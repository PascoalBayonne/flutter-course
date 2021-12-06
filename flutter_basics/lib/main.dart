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
      'Question': 'What is iGo app?',
      'Answers': ['A date app', 'An app to find pets', 'An app for events']
    },
    {
      'Question': 'When it was released?',
      'Answers': ['1975', '2077', '2022']
    },
    {
      'Question': 'The dev team are from',
      'Answers': ['USA', 'Bangladesh', 'Portugal']
    }
  ];

  var _questionIndex =
      0; // the "_" means that its a private field, so it cannot be changed outside (encapsulation)
  void _answerQuestion() {
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
                answerFunction: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(result: 'You did it boy'),
        // backgroundColor: Color(00),
      ),
    );
  }
}
