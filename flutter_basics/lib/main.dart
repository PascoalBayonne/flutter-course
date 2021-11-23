import 'package:flutter/material.dart';

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
    'On which day we had our marriage wedding?',
    'What\'s your favorite SO',
    'Mercedes or BMW'
  ];

  var _questionIndex = 0; // the "_" means that its a private field, so it cannot be changed outside (encapsulation)
  void answerQuestion() {
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
            Text(questions[_questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              focusColor: Color(05),
              color: Color(016),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () =>
                  print('Now you have just printed annonymous function'),
            )
          ],
        ),
        // backgroundColor: Color(00),
      ),
    );
  }
}
