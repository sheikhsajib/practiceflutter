import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practiceflutter/views/JCProfiles.dart';

class JCDrawer extends StatefulWidget {
  const JCDrawer({super.key});

  @override
  State<JCDrawer> createState() => _JCDrawerState();
}

class _JCDrawerState extends State<JCDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Sheikh Sajib"),
            accountEmail: Text("sajibsheikh9@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "../assets/Images/Hridi_Green_Queen.jpg",
                  width: 350, //(can't make it fit )
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("../assets/Images/BookLogo.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("My Public Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JCProfile()));
              }),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("All Categories"),
            onTap: () => print("All Categories List"),
          ),
          ListTile(
            leading: Icon(Icons.hexagon_sharp),
            title: Text("My Ranking"),
            onTap: () => print("Level Based and Global Rank"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Friends"),
            onTap: () => print("Check Your Friends and Ranking"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Daily Bonus"),
            onTap: () => print("Attendance Bonus Compund Style"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Daily Tips Coins"),
            onTap: () => print("A Tips posted in this Page everyday"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Daily Exam"),
            onTap: () => print("A 5 to 10 mcq with Coins"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Revision Unit"),
            onTap: () => print("Recently wrong answered Revision Unit"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("All Subjects"),
            onTap: () => print("Card View Subject Wise"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Mejor Courses"),
            onTap: () => print("Like BCS, Primary, AD, NTRCA, NSI"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Make Your Level Exam"),
            onTap: () => print("Your Modification Exam"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Rate 5 Star"),
            onTap: () => print("Review 5 Star"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Update App"),
            onTap: () => print("PlayStore/AppStore Update"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Reset My Level"),
            onTap: () => print("Start Form New or Specific Lession"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("App Language"),
            onTap: () => print("English or Bengali"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Pro Plan"),
            onTap: () => print("Go to Pro Plan Page"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Share to earn Coins"),
            onTap: () => print("Share"),
          ),
        ],
      ),
    );
  }
}
