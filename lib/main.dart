import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  final _question1 = const [
    {
      'questionText': 'What is your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What is your favourite lecturer?',
      'answers': [
        {'text': 'Max', 'score': 4},
        {'text': 'Adam', 'score': 3},
        {'text': 'Jack', 'score': 2},
        {'text': 'Tom', 'score': 1},
      ],
    },
  ];
  var _questionindex = 0;
  var _totalscore =0;

  void _resetQuiz(){
    setState(() {
      _questionindex=0;
      _totalscore=0;
    });
  }

  void _ansquestion(int score) {

    _totalscore = _totalscore+score;

    setState(() {
      _questionindex = _questionindex + 1;
    });
    print(_questionindex);

    if (_questionindex < _question1.length) {
      print('we have more question');
    } else {
      print('Question is finished');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Lab 3"),
        ),
        body: _questionindex < _question1.length
            ? Quiz(
          ansquestion: _ansquestion,
          questionindex: _questionindex,
          question1: _question1,
        )
            : Result(_totalscore,_resetQuiz),
      ),
    );
  }
}