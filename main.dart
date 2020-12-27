import 'package:flutter/material.dart';
// import 'package:udemy_flutter_quiz_app/result.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          "Sistem pemantau (monitoring system) yang digunakan untuk mengetahui adanya tamu tak diundang (intruder) atau adanya serangan(attack) disebut?",
      'answers': [
        {'text': 'IPS', 'score': 0},
        {'text': 'IRS', 'score': 0},
        {'text': 'IDS', 'score': 4},
        {'text': 'ISS', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Berapakah nilai desimal dari bilangan biner : 100010?",
      'answers': [
        {'text': '30', 'score': 0},
        {'text': '32', 'score': 0},
        {'text': '34', 'score': 0},
        {'text': '36', 'score': 4},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Berapakah nilai hexadesimal dari bilangan octal : 29?",
      'answers': [
        {'text': '0x16', 'score': 0},
        {'text': '0x18', 'score': 0},
        {'text': '0x20', 'score': 0},
        {'text': '0x32', 'score': 0},
        {'text': 'None of the above', 'score': 4}
      ],
    },
    {
      'questionText':
          "Apa istilah lain dari serangan Distributed Denial of Service?",
      'answers': [
        {'text': 'Salami slicing', 'score': 0},
        {'text': 'Smurf attack', 'score': 4},
        {'text': 'Spoof attack', 'score': 0},
        {'text': 'Brute force', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Berapakah nilai binary dari bilangan desimal : 24?",
      'answers': [
        {'text': '10111', 'score': 0},
        {'text': '11000', 'score': 4},
        {'text': '11001', 'score': 0},
        {'text': '11010', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText':
          "Berikut merupakan bentuk-bentuk serangan pada sistem komputer, kecuali?",
      'answers': [
        {'text': 'Inception', 'score': 4},
        {'text': 'Modification', 'score': 0},
        {'text': 'Fabrication', 'score': 0},
        {'text': 'Interruption', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText':
          "Dari beberapa pilihan berikut, manakah yang memiliki tingkat keamanan yang paling rendah dan mudah diretas?",
      'answers': [
        {'text': 'Password', 'score': 0},
        {'text': 'Biometric', 'score': 0},
        {'text': 'PIN', 'score': 4},
        {'text': 'Digital signature', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText':
          "Suatu program komputer yang bertujuan mereplikasi diri dan bertujuan merusak sistem komputer disebut?",
      'answers': [
        {'text': 'Rootkit', 'score': 0},
        {'text': 'Spam', 'score': 4},
        {'text': 'Virus', 'score': 0},
        {'text': 'Sniffer', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText':
          "Metode berikut digunakan untuk melakukan pengecekan integritas data, kecuali?",
      'answers': [
        {'text': 'Checksum', 'score': 0},
        {'text': 'Hash function', 'score': 0},
        {'text': 'Parity check', 'score': 0},
        {'text': 'Bash', 'score': 4},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': "Aksi merubah tampilan muka suatu website disebutr?",
      'answers': [
        {'text': 'Deface', 'score': 4},
        {'text': 'Dehack', 'score': 0},
        {'text': 'Decrypt', 'score': 0},
        {'text': 'DoS', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Evaluation'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
