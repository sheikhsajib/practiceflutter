import 'package:flutter/material.dart';

class ContainerBorderPractice extends StatelessWidget {
  const ContainerBorderPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(12),
        ),

        // alignment: Alignment.center, //For Center Text
        child: Text("Hello World",
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
