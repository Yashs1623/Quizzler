import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain(); //this is the object of our class

void main() {
  runApp(
    Quizzler(),
  );
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text(
            'It\'s Quiz Time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "FINISHED!",
          desc:
              'You\'ve reached the end of the quiz.\n You have scored: $score / 6',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
        score = 0;
      } else {
        if (userPickedAnswer == correctAnswer) {
          score++;
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

//   List<String> questions = [
//     'Shane Warne\’s final delivery in Test cricket was hit for four by Steve Harmison?',
//     'India won the world cup 3 times.',
//     'India won the 2017 champions trophy.',
//     'Rohit Sharma has done two double centuries in ODI.'
//   ];
//
//   List<bool> answers = [true, true, false, true];

//Upar pehle jo do alag list banayi thi unhe club krliya by making class of quesion and answers
//   List<Question> questionBank = [
//     Question(
//         q: 'Shane Warne\’s final delivery in Test cricket was hit for four by Steve Harmison?',
//         a: true),
//     Question(q: 'India won the world cup 3 times.', a: true),
//     Question(q: 'India won the 2017 champions trophy.', a: false),
//     Question(q: 'Rohit Sharma has done two double centuries in ODI.', a: true),
//   ];

  //we will shift this to quizbrain.dart file and make it private and also to avoid crashing of app at the end
//   int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
