import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/widgets/JCAppBar.dart';
import 'package:practiceflutter/widgets/JCDrawer.dart';
import 'package:practiceflutter/screens/HomePage/JCHomePageTopMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JCAppBar(
        title: "Home Page",
        centerTitle: true,
      ),
      drawer: JCDrawer(),
      body: JCHomePageTopMenu(),
      //body: McqDesign(),
    );
  }
}