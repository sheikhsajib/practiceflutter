import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/views/JCBasicCoursePage.dart';
import 'package:practiceflutter/views/JCExamPage.dart';
import 'package:practiceflutter/views/JCExplorePage.dart';
import 'package:practiceflutter/views/JCPeopleQueryPages.dart';
import 'package:practiceflutter/views/JCPostPage.dart';
import 'package:practiceflutter/views/JCPracticePage.dart';
import 'package:practiceflutter/views/JCProPlanPage.dart';
import 'package:practiceflutter/views/StartPage.dart';

class JCTopMenu extends StatefulWidget {
  const JCTopMenu({super.key});

  @override
  State<JCTopMenu> createState() => _JCTopMenuState();
}

class _JCTopMenuState extends State<JCTopMenu> {
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
          gradient: LinearGradient(colors: [Colors.blue, Colors.green])),
      child: Column(
        children: [
          SizedBox(
            height: 60,
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
                                ? BorderRadius.circular(10)
                                : BorderRadius.circular(2),
                            border: current == index
                                ? Border.all(color: Colors.black54, width: 4)
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
                    // Visibility(
                    //     visible: current == index,
                    //     child: Container(
                    //       width: 5,
                    //       height: 5,
                    //       decoration: const BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Color.fromARGB(137, 0, 0, 0)),
                    //     ))
                  ],
                );
              },
            ),
          ),

          // Top Menuwise Body
          Container(
            //margin: const EdgeInsets.only(top: 30),
            //width: double.infinity,
            //height: 480,
            //color: Colors.purple,
            child: Column(
              children: <Widget>[
                menuPages[current] // Icon(
                //   menuPages[current],
                //   size: 200,
                //   color: Colors.greenAccent,
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   topMenuItems[current],
                //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
