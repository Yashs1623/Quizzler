class Question {
  String questionText =
      'Shane Warne\’s final delivery in Test cricket was hit for four by Steve Harmison?';
  bool questionAnswer = true;

  //The below function is called as constructor
  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
