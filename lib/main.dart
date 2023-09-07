import 'package:flutter/material.dart';
import 'package:practiceflutter/AppBarPractice.dart';
import 'package:practiceflutter/ColumnPractice.dart';
import 'package:practiceflutter/ContainerBorderPractice.dart';
import 'package:practiceflutter/ImagePractice.dart';
import 'package:practiceflutter/RowPractice.dart';
import 'package:practiceflutter/views/HomePage.dart';
import 'package:practiceflutter/views/LoadingPage.dart';

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
    //  home: ContainerBorderPractice(),
    // home: RowPractice(),
    // home: ColumnPractice(),
    //home: ImagePractice(),
    //home: AppBarPractice(),
    //home: LoadingPage(),
    home: HomePage(),
  ));
}
