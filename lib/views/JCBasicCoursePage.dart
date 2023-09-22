import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCBasicCoursePage extends StatefulWidget {
  const JCBasicCoursePage({super.key});

  @override
  State<JCBasicCoursePage> createState() => _JCBasicCoursePageState();
}

class _JCBasicCoursePageState extends State<JCBasicCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "This is Basic Page To Edit",
        style: TextStyle(
          fontSize: 50,
        ),
      )),
    );
  }
}
