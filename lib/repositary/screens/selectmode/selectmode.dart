import 'package:bingo/repositary/screens/userprofile/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../multiplayer/multiplayer.dart';
import '../widgets/uihelper.dart';

class Selectmode extends StatefulWidget {
  const Selectmode({super.key});

  @override
  State<Selectmode> createState() => _SelectmodeState();
}

class _SelectmodeState extends State<Selectmode> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Userprofile()));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : AssetImage("assets/images/default_avatar.png")
                        as ImageProvider,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                )
              ],
            ),
          )
        ],
        title: Uihelper.bingo(
          imgurl: "bingo.png",
          height: 40,
          width: 120,
        ),
        centerTitle: true,
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
