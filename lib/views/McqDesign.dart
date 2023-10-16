import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadJson extends StatelessWidget {
  const LoadJson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/data/qbank.json"),
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            if (myData == null) {
              return Center(
                child: Text(
                  "Loading",
                ),
              );
            } else {
              return QuizPage(mydata: myData);
            }
          }),
    );
  }
}

class QuizPage extends StatefulWidget {
  final myData;
  QuizPage({Key key, @required this.myData}) : super(key: key);

  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState(myData: myData);
}

class _QuizPageState extends State<QuizPage> {
  var myData;
  _QuizPageState({this.myData});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        child: Center(
          child: Text(myData),
        ),
      ),
    );
  }
}
