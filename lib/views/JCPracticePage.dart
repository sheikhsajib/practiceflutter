import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCPracticePage extends StatefulWidget {
  const JCPracticePage({super.key});

  @override
  State<JCPracticePage> createState() => _JCPracticePageState();
}

class _JCPracticePageState extends State<JCPracticePage> {
  List<String> subject_icons = [
    '../assets/icons/Bangla_icon.png',
    '../assets/icons/English_icon.png',
    '../assets/icons/Bangladesh_icon.png',
    '../assets/icons/International_icon.png',
    '../assets/icons/Math_icon.png',
    '../assets/icons/Mantal_ability_icon.png',
    '../assets/icons/ICT_icon.png',
    '../assets/icons/Value_and_ethics_icon.png',
    '../assets/icons/GK_icon.png',
    '../assets/icons/Geography_icon.png',
  ];
  List<String> subjects = [
    "Bangla",
    "English",
    "Bangladesh",
    "International",
    "Math",
    "Science",
    "Computer",
    "Mental ability",
    "Ethics",
    "Geography",
  ];

  final List<Color> colors = [
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.grey,
    Colors.brown,
    // Add more colors here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      child: GridView.builder(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors[index],
              boxShadow: [
                BoxShadow(
                  color: Color(0xffDDDDDD),
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 0.0),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors[index].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffDDDDDD),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Image.asset(
                      subject_icons[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  subjects[index],
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
