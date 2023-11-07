import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/screens/HomePage/HomePage.dart';

class resultPage extends StatefulWidget {
  int marks;
  resultPage({Key? key, required this.marks}) : super(key: key);

  @override
  State<resultPage> createState() => _resultPageState(marks);
}

class _resultPageState extends State<resultPage> {
  int marks;
  _resultPageState(this.marks);
  List<String> resultTrophyImages = [
    "assets/result/resultVeryGood.png",
    "assets/result/resultGood.png",
    "assets/result/resultFail.png",
  ];
  String message = "Good";
  String resultTrophyImage = "";
  @override
  void initState() {
    if (marks < 20) {
      resultTrophyImage = resultTrophyImages[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 35) {
      resultTrophyImage = resultTrophyImages[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      resultTrophyImage = resultTrophyImages[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              resultTrophyImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Quando",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  // padding: EdgeInsets.symmetric(
                  //   vertical: 10.0,
                  //   horizontal: 25.0,
                  // ),
                  // borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  // splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
