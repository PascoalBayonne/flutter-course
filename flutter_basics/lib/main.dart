import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  var questions = [
    'What is iGo app?',
    'When it was released?',
    'Would you recommend'
  ];

  var _questionIndex =
      0; // the "_" means that its a private field, so it cannot be changed outside (encapsulation)
  void _answerQuestion() {
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
        appBar: AppBar(
          title: Text('iGo'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion)
          ],
        ),
        // backgroundColor: Color(00),
      ),
    );
  }
}
