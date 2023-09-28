import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JCLeaderBoard extends StatefulWidget {
  const JCLeaderBoard({super.key});

  @override
  State<JCLeaderBoard> createState() => _JCLeaderBoardState();
}

class _JCLeaderBoardState extends State<JCLeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Leaderboard"),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                offset: Offset(0, 50),
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                        child: Text("Update Profile"), value: "Update"),
                    PopupMenuItem(child: Text("Settings"), value: "Settings"),
                    PopupMenuItem(
                        child: ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        ),
                        value: "Share"),
                  ];
                }),
          ],
        ),
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text(
                "Player ${index + 1}",
              ),
              subtitle: Text("Total Question 200 between 10 Categories"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => print("Player ${index + 1}"),
            );
          },
        ));
  }
}
