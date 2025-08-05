import 'package:bingo/repositary/screens/multiplayer/multiplayer.dart';
import 'package:bingo/repositary/screens/room/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Joinroom extends StatefulWidget {
  @override
  State<Joinroom> createState() => _JoinroomState();
}

class _JoinroomState extends State<Joinroom> {
  final TextEditingController roomIdcontroller = TextEditingController();

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Multiplayer()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Image.asset("assets/images/bingo.png", height: 40, width: 120),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff3A3A3A),
                border: Border.all(color: Colors.white70),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Player",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Join a Room",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      controller: roomIdcontroller,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter room ID",
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () async {
                            final roomCode = roomIdcontroller.text.trim();

                            if (roomCode.isEmpty) {
                              showSnack("Please enter a room code");
                              return;
                            }

                            final currentUser =
                                FirebaseAuth.instance.currentUser;
                            if (currentUser == null) {
                              showSnack("User not authenticated");
                              return;
                            }

                            try {
                              final userDoc = await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(currentUser.uid)
                                  .get();

                              final userData = userDoc.data();
                              final name = userData?['name'] ?? 'Unknown';
                              final photoUrl = userData?['photoUrl'] ?? '';

                              final roomDoc = await FirebaseFirestore.instance
                                  .collection('rooms')
                                  .doc(roomCode)
                                  .get();

                              if (!roomDoc.exists) {
                                showSnack("Room not found");
                                return;
                              }

                              final selectedColorHex =
                                  roomDoc['selectedColor'] ?? 'FF2196F3';
                              final selectedTimer =
                                  roomDoc['selectedTimer'] ?? 30;
                              final selectedColor =
                                  Color(int.parse('0x$selectedColorHex'));

                              List<dynamic>? boardFromRoom =
                                  roomDoc.data()?['customBoard'];
                              List<int> customBoard = boardFromRoom != null
                                  ? List<int>.from(boardFromRoom)
                                  : List.generate(25, (index) => index + 1)
                                ..shuffle();

                              await FirebaseFirestore.instance
                                  .collection('rooms')
                                  .doc(roomCode)
                                  .collection('players')
                                  .doc(currentUser.uid)
                                  .set({
                                'name': name,
                                'photoUrl': photoUrl,
                                'color': selectedColor.value.toRadixString(16),
                                'isHost': false,
                                'joinedAt': FieldValue.serverTimestamp(),
                              });

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Room(
                                    roomCode: roomCode,
                                    selectedColor: selectedColor,
                                    selectedTimer: selectedTimer,
                                    customBoard: customBoard,
                                  ),
                                ),
                              );
                            } catch (e) {
                              showSnack("Something went wrong");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text(
                            "Join",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
