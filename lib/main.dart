import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

/*void main() {
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      "questionText": "Таны дуртай өнгө юу вэ?",
      "answer": [
        {"text": "Хар", "score": 10},
        {"text": "Улаан", "score": 5},
        {"text": "Ногоон", "score": 3},
        {"text": "Цагаан", "score": 1}
      ],
    },
    {
      "questionText": "Таны дуртай амьтан юу вэ?",
      "answer": [
        {"text": "Адуу", "score": 3},
        {"text": "Үхэр", "score": 5},
        {"text": "Хонь", "score": 7},
        {"text": "Ямаа", "score": 9},
        {"text": "Тэмээ", "score": 10}
      ],
    },
    {
      "questionText": "Таны дуртай багш хэн бэ?",
      "answer": [
        {"text": "Migaa", "score": 1},
        {"text": "Migaa", "score": 1},
        {"text": "Migaa", "score": 1},
        {"text": "Migaa", "score": 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswer(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print('Asuult duusaagui baina ');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var temp = ['Hello'];
    temp.add('bat');
    print(temp);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _questionAnswer,
                questions: questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
