import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practiceflutter/screens/exam_pages/mcq_practice_design.dart';

class LoadJson extends StatefulWidget {
  const LoadJson({super.key});

  @override
  State<LoadJson> createState() => _LoadJsonState();
}

class _LoadJsonState extends State<LoadJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/data/qbank.json"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List myData = json.decode(snapshot.data.toString());
              if (myData != null) {
                return QuizPage(myData: myData);
              } else {
                return const Center(
                  child: Text(
                    "Loading",
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
