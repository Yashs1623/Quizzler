import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  //below I have made my list private : naam k aage underscore lagake private banaskte hai
  List<Question> _questionBank = [
    Question(
        q: 'Shane Warne\’s final delivery in Test cricket was hit for four by Steve Harmison?',
        a: true),
    Question(q: 'India won the world cup 3 times.', a: true),
    Question(q: 'India won the 2017 champions trophy.', a: false),
    Question(q: 'Rohit Sharma has done two double centuries in ODI.', a: true),
    Question(q: 'Cricket was included in Olympics only once?', a: true),
    Question(q: 'In Cricket Tie and Draw are same?', a: false),
    Question(q: 'In Cricket Tie and Draw are same?', a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  //since the upper list is private thus my main.dart file is unable to access list so :
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
