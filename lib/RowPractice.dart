import 'package:flutter/material.dart';

class RowPractice extends StatelessWidget {
  const RowPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              color: Colors.blueGrey,
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              height: 100,
              color: Color.fromARGB(255, 154, 223, 255),
              child: Text(
                "Sheikh",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              height: 100,
              color: Color.fromARGB(255, 114, 250, 143),
              child: Text(
                "Sajib",
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        )),
      ],
    ));
  }
}
