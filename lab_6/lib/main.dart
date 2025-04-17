import 'package:flutter/material.dart';

import 'QuizBrain.dart';
import 'custom_button.dart';


void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (quizBrain.isFinished()) {
        // Show alert and reset
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Đổi màu nền
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow, // Đổi màu chữ
                    fontSize: 28.0, // Đổi kích thước chữ
                    fontWeight: FontWeight.bold, // Đổi độ đậm chữ
                  ),
                ),
              ),
            ),
            CustomButton(
              text: 'True',
              color: Colors.green,
              onPressed: () => checkAnswer(true),
            ),
            CustomButton(
              text: 'False',
              color: Colors.red,
              onPressed: () => checkAnswer(false),
            ),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}
