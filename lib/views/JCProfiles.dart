import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/common_widgets/JCAppBar.dart';
import 'package:practiceflutter/common_widgets/JCDrawer.dart';

class JCProfile extends StatelessWidget {
  const JCProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JCAppBar(
        title: "Profile Page",
        centerTitle: true,
      ),
      drawer: JCDrawer(),
    );
  }
}
