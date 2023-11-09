import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:practiceflutter/screens/home_pages/home.dart';
import 'package:practiceflutter/screens/result_pages/practice_result_page.dart';

class LoadJson extends StatelessWidget {
  const LoadJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/data/qbank.json"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List myData = json.decode(snapshot.data.toString());
              if (myData == null) {
                return Center(
                  child: Text(
                    "Loading",
                  ),
                );
              } else {
                return QuizPage(myData: myData);
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class QuizPage extends StatefulWidget {
  final myData;
  QuizPage({Key? key, this.myData}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState(myData: myData);
}

class _QuizPageState extends State<QuizPage> {
  List myData;
  _QuizPageState({required this.myData});

  int i = 1;
  int marks = 0;

  Color colorToShow = Colors.cyan;
  Color rightAns = Colors.green;
  Color wrongAns = Colors.orange;

  Map<String, Color> mcqOptionColor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan,
  };
  void resetColorifWrong() {
    mcqOptionColor["a"] = Colors.cyan;
    mcqOptionColor["b"] = Colors.cyan;
    mcqOptionColor["c"] = Colors.cyan;
    mcqOptionColor["d"] = Colors.cyan;
  }

  void nextQuestion() {
    // cancelTimer = false;
    // timer = 30;
    setState(() {
      if (i < 3) {
        // i = random_array[j];
        // j++;
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultPage(marks: marks),
        ));
      }
      mcqOptionColor["a"] = Colors.cyan;
      mcqOptionColor["b"] = Colors.cyan;
      mcqOptionColor["c"] = Colors.cyan;
      mcqOptionColor["d"] = Colors.cyan;
      // disableAnswer = false;
      wrongAttempts = 0;
    });
    // startTimer();
  }

  int wrongAttempts = 0;
  bool isAnswerCorrect = false;

  void correctAnsPopUpDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: AlertDialog(
              title: const Text("Assalamu Alaikum"),
              content: const Text(
                  "Alhamdulillah \n Your Answer is Correct. \n Yes, Success Will come soon Inshallah."),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      },
    );
  }

  void wrongAnsPopUpDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: AlertDialog(
              title: const Text("Try Another"),
              content: const Text(
                  "Foinni \n You may try again \n Success come from practice."),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      },
    );
  }

// When the user clicks on an answer button
  void checkAnswer(String k) {
    if (myData[2][i.toString()] == myData[1][i.toString()][k]) {
      //defined points for each answer.
      int points = 10;
      if (wrongAttempts == 0) {
        // Correct Answer on First Attempts. Add 10 points to the score
        marks += points;
        isAnswerCorrect = true;
        colorToShow = rightAns;
        correctAnsPopUpDialog(context);
        print("$wrongAttempts WrongAttempts Add Mark 10 total $marks");
      } else if (wrongAttempts == 1) {
        // If the answer is wrong for first time, Points will be half of the score
        marks += (points / 2).round();
        isAnswerCorrect = true;
        colorToShow = rightAns;
        print("$wrongAttempts WrongAttempts Add Mark 5 total $marks");
      } else if (wrongAttempts == 2) {
        // 2 time wrong Attempst will no Points.
        marks += points - points;
        isAnswerCorrect = true;
        colorToShow = rightAns;
        print("$wrongAttempts WrongAttempts Add Mark 0 total $marks");
      } else {
        // 2 time wrong Attempst will no Points.
        marks += (points - points) - ((points / 2).round());
        isAnswerCorrect = true;
        colorToShow = rightAns;
        print("$wrongAttempts WrongAttempts Add Mark -5 total $marks");
      }
    } else {
      wrongAttempts++;
      isAnswerCorrect = false;
      colorToShow = wrongAns;
      wrongAnsPopUpDialog(context);
    }

    setState(() {
      if (colorToShow == wrongAns) {
        mcqOptionColor[k] = colorToShow;
        Timer(Duration(seconds: 2), resetColorifWrong);
      } else {
        mcqOptionColor[k] = colorToShow;
        Timer(Duration(seconds: 2), nextQuestion);
      }
    });
  }

  Widget choicebButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {
          checkAnswer(k);
        },
        child: Text(
          myData[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          maxLines: 1,
        ),
        // color: btncolor[k],
        color: mcqOptionColor[k],
        splashColor: Colors.blue[700],
        highlightColor: Colors.orange,
        minWidth: 350.0,
        height: 50.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

// will pop back Button
  Widget _qpStayHereButton() {
    return TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (context) => HomePage()));
      },
    );
  }

// will pop back Button
  Widget _qpGoBackButton() {
    return TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

// Will Pop Code Start here
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        "Job Combat Quiz",
                      ),
                      content: Text("Do You Want to Close Your Learning."),
                      actions: <Widget>[
                        _qpStayHereButton(),
                        _qpGoBackButton(),
                      ],
                    )) ??
            false);
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  myData[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebButton('a'),
                    choicebButton('b'),
                    choicebButton('c'),
                    choicebButton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    "No Timer",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
