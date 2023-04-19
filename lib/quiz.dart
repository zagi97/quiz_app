import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /*  Widget? activeScreen;  */ //može biti i null
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
/* 
  @override
  //izvršiti će se prije build methode
  void initState() {
    super.initState();
    /* activeScreen = StartScreen(switchScreen); */
    
  } */

  //Kada se activeScreen promijeni, build() metoda se poziva i ponovno ispisuje UI
 void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    /*  final screenWidget = activeScreen == 'start-screen' //true or false
        ? StartScreen(switchScreen) //if true
        : const QuestionsScreen(); //if false */

    Widget screenWidget = StartScreen(switchScreen);

    
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 72, 34, 138),
                  Color.fromARGB(255, 97, 23, 182),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget), //if false
      ),
    );
  }
}
