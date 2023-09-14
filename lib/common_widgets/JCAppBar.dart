import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCAppBar extends StatefulWidget {
  const JCAppBar({super.key});

  @override
  State<JCAppBar> createState() => _JCAppBarState();
}

class _JCAppBarState extends State<JCAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.message),
        title: Text("Home Page"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.green, Colors.blue])),
        ),
        actions: [Icon(Icons.search), Icon(Icons.notifications)],
        //give a space between two Icons.
      ),
    );
  }
}
