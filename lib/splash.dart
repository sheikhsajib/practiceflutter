import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practiceflutter/screens/home_pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Image.asset(
          "assets/Images/Logo.jpg",
          height: 250,
          //  "assets/Images/Logo.png",
          //(can't make it fit )
        ),
      ),
    );
  }
}
