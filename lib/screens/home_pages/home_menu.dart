import 'package:flutter/material.dart';

import 'package:practiceflutter/screens/JCBasicCoursePage.dart';
import 'package:practiceflutter/screens/exam_pages/JCExamPage.dart';
import 'package:practiceflutter/screens/JCExplorePage.dart';
import 'package:practiceflutter/screens/JCPeopleQueryPages.dart';
import 'package:practiceflutter/screens/JCPostPage.dart';
import 'package:practiceflutter/screens/JCPracticePage.dart';
import 'package:practiceflutter/screens/JCProPlanPage.dart';
import 'package:practiceflutter/screens/home_pages/home_dashboard_page.dart';

class JCHomePageTopMenu extends StatefulWidget {
  const JCHomePageTopMenu({super.key});

  @override
  State<JCHomePageTopMenu> createState() => _JCHomePageTopMenuState();
}

class _JCHomePageTopMenuState extends State<JCHomePageTopMenu> {
  List<String> topMenuItems = [
    "Home",
    "Basic Course",
    "Practice",
    "Exam",
    "Peoples's Query",
    "Explore",
    "Post",
    "Premium Plan"
  ];
  List<Widget> menuPages = [
    JCHomePage(),
    JCBasicCoursePage(),
    JCPracticePage(),
    JCExamPage(),
    JCPeopleQueryPages(),
    JCExplorePage(),
    JCPostPage(),
    JCProPlanPage(),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.white70, Colors.greenAccent])),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: topMenuItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(1),
                        width: 80,
                        height: 35,
                        decoration: BoxDecoration(
                            color: current == index
                                ? Colors.black87
                                : Colors.black54,
                            borderRadius: current == index
                                ? BorderRadius.circular(5)
                                : BorderRadius.circular(2),
                            border: current == index
                                ? Border.all(color: Colors.black54, width: 2)
                                : null),
                        child: Center(
                          child: Text(
                            topMenuItems[index],
                            style: TextStyle(
                                color: current == index
                                    ? Colors.white
                                    : Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Top Menuwise Body
          Container(
            child: Column(
              children: <Widget>[
                menuPages[current] // Icon(
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// child: PageView(
//               children: menuPages,
//               scrollDirection: Axis.horizontal,
//               controller: PageController(),
//               onPageChanged: (num) {
//                 print(num);
//               },
//             ),
