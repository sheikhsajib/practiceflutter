import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practiceflutter/model/right_ans_funny_comments_model.dart';

class JCHomePage extends StatefulWidget {
  const JCHomePage({super.key});

  @override
  State<JCHomePage> createState() => _JCHomePageState();
}

class _JCHomePageState extends State<JCHomePage> {
  final nameRepository = NameRepository();
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              final names = await nameRepository.loadNames();
              final random = Random();
              final randomIndex = random.nextInt(names.length);
              final randomName = names[randomIndex].name;
              print(randomName);

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Random Name'),
                  content: Text(randomName),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Generate Random Name'),
          ),
        ),
        // Container(
        //   height: 60,
        //   width: double.infinity,
        //   padding: EdgeInsets.all(20),
        //   color: Color.fromARGB(179, 174, 255, 181),
        //   child: Text(
        //     "Your Home Work Today আপনার আজকের বাড়িরকাজ",
        //     style: TextStyle(
        //       fontSize: 19,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.green,
        //     ),
        //   ),
        // ),
        // Container(
        //     height: 200,
        //     width: double.infinity,
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       physics: BouncingScrollPhysics(),
        //       children: [
        //         SizedBox(
        //           width: 300,
        //           child: Card(
        //             color: Colors.orange,
        //             child: Padding(
        //               padding: EdgeInsets.all(10),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Take Lesson 17",
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.w800,
        //                       fontSize: 30,
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Text("Everyday Lesson Form Basic"),
        //                   SizedBox(
        //                     height: 20,
        //                   ),
        //                   RichText(
        //                     text: TextSpan(
        //                       children: [
        //                         TextSpan(
        //                           text: "Bonus Point 100 ",
        //                         ),
        //                         WidgetSpan(
        //                           child: Icon(Icons.money, size: 14),
        //                         ),
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 300,
        //           child: Card(
        //             color: Colors.green,
        //           ),
        //         ),
        //         SizedBox(
        //           height: 200,
        //           width: 300,
        //           child: Card(
        //             color: Colors.purple[300],
        //           ),
        //         )
        //   ],
        // )),
      ],
    );
  }
}
