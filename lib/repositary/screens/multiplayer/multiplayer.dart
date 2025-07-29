import 'package:bingo/repositary/screens/room/room.dart';
import 'package:flutter/material.dart';

import '../selectmode/selectmode.dart';
import '../widgets/uihelper.dart';

class Multiplayer extends StatefulWidget {
  const Multiplayer({super.key});

  @override
  State<Multiplayer> createState() => _MultiplayerState();
}

class _MultiplayerState extends State<Multiplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Selectmode()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Uihelper.CustomImage1(imgurl: "bingo.png"),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff2a2e50),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff2c3054), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 50,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Online Multiplayer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      SizedBox(height: 40),
                      Uihelper.createbtn(
                        buttonnname: "Create",
                        callback: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Room()));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Uihelper.joinbtn(buttonnname: "Join", callback: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
