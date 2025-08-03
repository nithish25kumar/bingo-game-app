import 'package:bingo/repositary/screens/gameSettings/customizeBoard.dart';
import 'package:bingo/repositary/screens/gameSettings/gameSettings.dart';
import 'package:bingo/repositary/screens/joinroom/joinroom.dart';
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
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3A),
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 50,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        "Online Multiplayer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Uihelper.createbtn(
                        buttonnname: "CREATE",
                        callback: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Gamesettings()));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "or",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Uihelper.joinbtn(
                          buttonnname: "JOIN",
                          callback: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Joinroom()));
                          }),
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
