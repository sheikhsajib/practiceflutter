import 'package:flutter/material.dart';

class ColumnPractice extends StatelessWidget {
  const ColumnPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 500,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
              alignment: Alignment.bottomRight,
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 100,
              width: 300,
              color: Color.fromARGB(255, 154, 223, 255),
              child: Text(
                "Sheikh Shah Gazi Sajib uddin Saheb",
                style: TextStyle(fontSize: 25, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              height: 100,
              color: Color.fromARGB(255, 114, 250, 143),
              child: Text(
                "Sajib",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
