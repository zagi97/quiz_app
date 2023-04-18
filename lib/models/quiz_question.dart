import 'package:flutter/widgets.dart';

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers); //kopirali smo listu te ćemo ju promijeniti, a da ne diramo originalnu listu
    shuffledList.shuffle();
    return shuffledList;
    }
}