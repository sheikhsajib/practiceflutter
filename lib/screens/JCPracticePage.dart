import 'package:flutter/material.dart';
import 'package:practiceflutter/screens/exam_pages/load_mcq.dart';

class JCPracticePage extends StatefulWidget {
  const JCPracticePage({super.key});

  @override
  State<JCPracticePage> createState() => _JCPracticePageState();
}

class _JCPracticePageState extends State<JCPracticePage> {
  List<String> subjectIcons = [
    'assets/icons/Bangla_icon.png',
    'assets/icons/English_icon.png',
    'assets/icons/Bangladesh_icon.png',
    'assets/icons/Bangladesh_icon.png',
    '../assets/icons/International_icon.png',
    '../assets/icons/Math_icon.png',
    '../assets/icons/Mantal_ability_icon.png',
    '../assets/icons/ICT_icon.png',
    '../assets/icons/Value_and_ethics_icon.png',
    '../assets/icons/GK_icon.png',
    '../assets/icons/Geography_icon.png',
  ];
  List<String> subjectsName = [
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

  final List<Color> subjectCategoryColors = [
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
//// An Widget For Subjects Category in a card
  Widget subjectCategoryCard(
    Color subjectCategoryColors,
    String subjectsName,
    String subjectIcons,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoadJson(),
            ));

        debugPrint("Tapped $subjectsName");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: subjectCategoryColors,
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
                  color: subjectCategoryColors.withOpacity(0.8),
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
                  subjectIcons,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              subjectsName,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  } ///// Subject Category Card Desing Finish.

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
          return subjectCategoryCard(
            subjectCategoryColors[index],
            subjectsName[index],
            subjectIcons[index],
          );
        },
      ),
    );
  }
}
