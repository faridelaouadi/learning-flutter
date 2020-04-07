import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage("images/pic.jpeg"),
            ),
            Text(
              "Farid El-Aouadi",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower',
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 200.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.teal,
                  size: 24.0,
                ),
                title: Text(
                  "+44 7446 33 11 88",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                  size: 24.0,
                ),
                title: Text(
                  "faridelaouadi@hotmail.co.uk",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: Icon(
                  Icons.description,
                  color: Colors.teal,
                  size: 24.0,
                ),
                title: Text(
                  "Bio",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
