import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/screens/HomePage/HomePage.dart';
import 'package:practiceflutter/screens/ResultPages/resultpage.dart';

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

  int timer = 30;
  bool cancelTimer = false;
  String showTimer = "30";

  Map<String, Color> mcqOptionColor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan,
  };

  void nextQuestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
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
    });
    startTimer();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void checkAnswer(String k) {
    if (myData[2][i.toString()] == myData[1][i.toString()][k]) {
      //The Answer is Correnct
      marks = marks + 5;
      colorToShow = rightAns;
    } else {
      colorToShow = wrongAns;
    }
    setState(() {
      cancelTimer = true;
      mcqOptionColor[k] = colorToShow;
      Timer(Duration(seconds: 2), nextQuestion);
    });
  }

  Widget choicebButton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
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
                        "Quizstar",
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
                    showTimer,
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
