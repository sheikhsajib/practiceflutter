import 'package:flutter/material.dart';

class AppBarPractice extends StatelessWidget {
  const AppBarPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return Image.asset(
              "assets/Images/Hridi_Green_Queen.jpg",
            );
          }),
          title: Text("Image Practice"),
        ),
        drawer: Drawer(),
        body: SafeArea(
            child: Center(
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  "assets/Images/Hridi_Green_Queen.jpg",
                  height: 200,
                  width: 150,
                ),
              ),
              Container(
                height: 300,
                width: 100,
                child: Image.network(
                  "https://images.pexels.com/photos/17485817/pexels-photo-17485817/free-photo-of-an-artist-s-illustration-of-artificial-intelligence-ai-this-image-represents-the-ways-in-which-ai-can-solve-important-problems-it-was-created-by-vincent-schwenk-as-part-of-the-visualis.png?auto=compress&cs=tinysrgb&w=600&lazy=load",
                ),
              )
            ],
          ),
        )));
  }
}
