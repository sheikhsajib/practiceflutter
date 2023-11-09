import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimerWidgets extends StatefulWidget {
  const TimerWidgets({super.key});

  @override
  State<TimerWidgets> createState() => _TimerWidgetsState();
}

class _TimerWidgetsState extends State<TimerWidgets> {
  int timer = 30;
  bool cancelTimer = false;
  String showTimer = "30";

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          // nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });

    setState(() {
      // cancelTimer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
