import 'package:flutter/material.dart';

import '../widgets/uihelper.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              Text(
                "Room",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Room ID:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.copy, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 490),
              Uihelper.CustomButton1(
                buttonnname: "Get.Set.Play",
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
