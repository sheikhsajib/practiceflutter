import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/common_widgets/JCAppBar.dart';
import 'package:practiceflutter/common_widgets/JCDrawer.dart';

List<String> subject_icons = [
  '../assets/icons/Bangla_icon.png',
  '../assets/icons/English_icon.png',
  '../assets/icons/Bangladesh_icon.png',
  '../assets/icons/International_icon.png',
  '../assets/icons/Math_icon.png',
  '../assets/icons/Mantal_ability_icon.png',
  '../assets/icons/ICT_icon.png',
  '../assets/icons/Value_and_ethics_icon.png',
  '../assets/icons/GK_icon.png',
  '../assets/icons/Geography_icon.png',
];
List<String> subjects = [
  "বাংলাবিদ",
  "Literary Nerd",
  "BD Soldier",
  "International Player",
  "গণিতজ্ঞ",
  "বিজ্ঞানী",
  "Programmer",
  "Intellectual ",
  "Moral",
  "Mapper",
];

class JCProfile extends StatelessWidget {
  const JCProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Public Profile"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              offset: Offset(0, 50),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text("Update Profile"), value: "Update"),
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
      drawer: JCDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: 150,
                  color: Colors.amber,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.black,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Color.fromARGB(0, 255, 0, 0),
                      child: ClipOval(
                        child: Image.asset(
                          '../assets/Images/Hridi_Green_Queen.jpg',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150, top: 150),
                  child: Material(
                    borderRadius: BorderRadius.circular(50.0),
                    elevation: 2,
                    child: IconButton(
                      iconSize: 28,
                      icon: Icon(
                        Icons.photo_camera,
                        color: Colors.grey,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Sheikh Sajib",
                    style: TextStyle(color: Color(0xFF575A89), fontSize: 28),
                  ),
                  // Picture and Name Finish
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.amber,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                        )
                      ],
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "1.8K coins",
                          )),
                          Expanded(
                              child: Text(
                            "32% Progress",
                          )),
                          Expanded(
                              child: Text(
                            "4/50 Trophies",
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Container(
                    child: GridView.builder(
                      padding: EdgeInsets.all(20),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.amber,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.5,
                                )
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Color(0xffDDDDDD),
                                    //     blurRadius: 6.0,
                                    //     spreadRadius: 2.0,
                                    //     offset: Offset(0.0, 0.0),
                                    //   )
                                    // ],
                                  ),
                                  child: Image.asset(
                                    subject_icons[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                subjects[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
