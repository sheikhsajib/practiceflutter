import 'package:flutter/material.dart';
import 'package:practiceflutter/splash.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Color.fromARGB(255, 255, 174, 0),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
    ),
    debugShowCheckedModeBanner: false,
    title: "Practice Flutter",
    home: const SplashScreen(),
  ));
}
