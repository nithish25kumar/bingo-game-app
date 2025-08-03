import 'package:bingo/repositary/screens/multiplayer/multiplayer.dart';
import 'package:bingo/repositary/screens/playersplayarea/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/uihelper.dart';
import 'package:flutter/services.dart';

class Room extends StatefulWidget {
  final Color selectedColor;
  final int selectedTimer;
  final List<int> customBoard;
  final String roomCode;

  const Room({
    super.key,
    required this.selectedColor,
    required this.selectedTimer,
    required this.customBoard,
    required this.roomCode,
  });

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Multiplayer()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rooms')
            .doc(widget.roomCode)
            .collection('players')
            .orderBy('joinedAt')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final players = snapshot.data!.docs;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: widget.roomCode));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Room ID copied!")),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.roomCode,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.copy, color: Colors.white, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  // 🔁 Dynamic Player List
                  ...players.map((playerDoc) {
                    final player = playerDoc.data() as Map<String, dynamic>;
                    final name = player['name'] ?? 'Player';
                    final photoUrl = player['photoUrl'] ?? '';
                    final isHost = player['isHost'] ?? false;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: photoUrl.isNotEmpty
                                ? NetworkImage(photoUrl)
                                : AssetImage('assets/images/default_user.png')
                                    as ImageProvider,
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 80,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Color(0xff60669b),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(19),
                              child: Row(
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Text(
                                    isHost ? "Host" : "Player",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  SizedBox(height: 60),
                  Uihelper.CustomButton1(
                    buttonnname: "Invite Friends",
                    callback: () {
                      // Share roomCode
                    },
                  ),
                  SizedBox(height: 20),
                  Uihelper.CustomButton1(
                    buttonnname: "Get.Set.Play",
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Game(
                            roomCode: widget.roomCode,
                            selectedColor: widget.selectedColor,
                            selectedTimer: widget.selectedTimer,
                            customBoard: widget.customBoard,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
