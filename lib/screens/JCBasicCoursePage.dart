import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCBasicCoursePage extends StatefulWidget {
  const JCBasicCoursePage({super.key});

  @override
  State<JCBasicCoursePage> createState() => _JCBasicCoursePageState();
}

class _JCBasicCoursePageState extends State<JCBasicCoursePage> {
  List<String> phrases = [
    "Phase 1",
    "Phase 2",
    "Phase 3",
    "Phase 4",
    "Phase 5",
    "Phase 6",
    "Phase 7",
    "Phase 8",
    "Phase 9",
    "Phase 10",
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
      height: 500,
      child: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            initiallyExpanded: index == 1, //attention
            title: Text(
              phrases[index],
            ),

            children: List.generate(20, (int i) {
              return ListTile(
                tileColor: colors[index],
                leading: Icon(Icons.category),
                title: Text('Day ${i + 1} For BCS'),
                subtitle: Text("Total Question 200 betiween 10 Categories"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => print("Day ${i + 1} Is Clicked"),
              );
            }),
          );
        },
      ),
    );
  }
}
