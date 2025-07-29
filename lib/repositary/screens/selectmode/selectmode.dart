import 'package:flutter/material.dart';

import '../multiplayer/multiplayer.dart';
import '../widgets/uihelper.dart';

class Selectmode extends StatefulWidget {
  const Selectmode({super.key});

  @override
  State<Selectmode> createState() => _SelectmodeState();
}

class _SelectmodeState extends State<Selectmode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Uihelper.CustomImage(imgurl: "nithish1.jpeg"),
          ),
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
              Uihelper.CustomImage(imgurl: "selectmode.png"),
              SizedBox(height: 60),
              Uihelper.CustomButton(
                buttonnname: "Online Multiplayer",
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Multiplayer()),
                  );
                },
              ),
              SizedBox(height: 20),
              Uihelper.CustomButton1(
                buttonnname: "Single Player",
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
