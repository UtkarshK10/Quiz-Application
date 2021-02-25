import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What \'s your favorite color?',
      'answers': [
        {'text': 'blue', 'score': 5},
        {'text': 'black', 'score': 4},
        {'text': 'red', 'score': 3},
        {'text': 'white', 'score': 2}
      ]
    },
    {
      'questionText': 'What \'s your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 4},
        {'text': 'cat', 'score': 2},
        {'text': 'rabbit', 'score': 3},
        {'text': 'panther', 'score': 5}
      ]
    },
    {
      'questionText': 'Who\'s your favorite Instructor?',
      'answers': [
        {'text': 'max', 'score': 1},
        {'text': 'brad', 'score': 5},
        {'text': 'Net Ninja', 'score': 4},
        {'text': 'colt', 'score': 3}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz()
  {
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
//    if (_questionIndex < _questions.length) {
//      print('we have more questions to show');
//    } else {
//      print('No more questions');
//    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
