import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../splashpage/splashscreen.dart';

class Game extends StatefulWidget {
  final Color selectedColor;
  final int selectedTimer;
  final List<int> customBoard;
  final String roomCode;

  const Game({
    super.key,
    required this.selectedColor,
    required this.selectedTimer,
    required this.customBoard,
    required this.roomCode,
  });
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Map<String, dynamic>> joinedPlayers = [];
  String? winnerId;

  User? user = FirebaseAuth.instance.currentUser;
  int completedLines = 0;
  List<bool> bingoStrike = [false, false, false, false, false];

  List<int> numbers = List.generate(25, (index) => index + 1);
  List<bool> selectedCells = List.generate(25, (index) => false);

  bool showResult = false;
  bool showexit = false;

  @override
  void initState() {
    super.initState();
    numbers = widget.customBoard;
    _addCurrentPlayerToRoom();
    _listenForWinner();
    _listenToPlayers();
  }

  void _listenForWinner() {
    FirebaseFirestore.instance
        .collection('rooms')
        .doc(widget.roomCode)
        .snapshots()
        .listen((doc) {
      final winner = doc.data()?['winner'];

      if (winner != null) {
        setState(() {
          winnerId = winner;
          showResult = true;
        });
      }
    });
  }

  void _addCurrentPlayerToRoom() async {
    if (user == null) return;

    final playerData = {
      'uid': user!.uid,
      'name': user!.displayName ?? 'Guest',
      'photoUrl': user!.photoURL ?? '',
      'color': widget.selectedColor.value,
    };

    final playerDoc = FirebaseFirestore.instance
        .collection('rooms')
        .doc(widget.roomCode)
        .collection('players')
        .doc(user!.uid);

    await playerDoc.set(playerData);
  }

  void _listenToPlayers() {
    FirebaseFirestore.instance
        .collection('rooms')
        .doc(widget.roomCode)
        .collection('players')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        joinedPlayers = snapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  void checkBingo() async {
    int lineCount = 0;
    List<bool> tempStrike = [false, false, false, false, false];

    // Row check
    for (int i = 0; i < 5; i++) {
      if (selectedCells.sublist(i * 5, (i + 1) * 5).every((val) => val)) {
        lineCount++;
      }
    }

    // Column check
    for (int i = 0; i < 5; i++) {
      bool allSelected = true;
      for (int j = 0; j < 5; j++) {
        if (!selectedCells[i + j * 5]) {
          allSelected = false;
          break;
        }
      }
      if (allSelected) lineCount++;
    }

    // Diagonal check
    if ([0, 6, 12, 18, 24].every((i) => selectedCells[i])) lineCount++;
    if ([4, 8, 12, 16, 20].every((i) => selectedCells[i])) lineCount++;

    int newCompletedLines = lineCount.clamp(0, 5);

    for (int i = 0; i < newCompletedLines; i++) {
      tempStrike[i] = true;
    }

    setState(() {
      completedLines = newCompletedLines;
      bingoStrike = tempStrike;
    });

    // If this player finishes bingo and no one has won yet
    if (newCompletedLines == 5) {
      final roomRef =
          FirebaseFirestore.instance.collection('rooms').doc(widget.roomCode);
      final roomDoc = await roomRef.get();
      if (roomDoc.data()?['winner'] == null) {
        // Set this player as winner
        await roomRef.update({
          'winner': user?.uid,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF171717),
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
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
        title: Uihelper.bingo(
          imgurl: "bingo.png",
          height: 40,
          width: 120,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showexit = true;
              });
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "🎮 Let the Game Begin!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildPlayerRow(
                    user?.displayName ?? 'You',
                    user?.photoURL ?? '',
                    widget.selectedColor,
                  ),
                  ...joinedPlayers
                      .where((player) => player['uid'] != user?.uid)
                      .map((player) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildPlayerRow(
                              player['name'] ?? 'Player',
                              player['photoUrl'] ?? '',
                              _getPlayerColor(player['color']),
                            ),
                          ))
                      .toList(),
                  SizedBox(height: 20),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Container(
                      height: 430,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff373c6d),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                final letter = "BINGO"[index];
                                final isStruck = bingoStrike[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        letter,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (isStruck)
                                        CustomPaint(
                                          size: Size(30, 30),
                                          painter: CrossStrikePainter(),
                                        ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 30),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: numbers.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final num = entry.value;
                                  final isSelected = selectedCells[index];

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCells[index] = true;
                                        checkBingo();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.green
                                            : widget.selectedColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$num',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showexit)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Center(
                    child: Container(
                      height: 190,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white70),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Text(
                              "Close App",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Do you want to exit the game? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showexit = false;
                                    });
                                  },
                                  child: Text("Cancel"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Splashscreen()),
                                    );
                                  },
                                  child: Text("Exit"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (showResult)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            winnerId == user?.uid ? "YOU WIN" : "YOU LOSE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showResult = false;
                              });
                            },
                            child: Text("Close"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _RankCard(String rank, String player, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Text(
          rank,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        title: Text(
          player,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPlayerRow(String name, String? photoUrl, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: photoUrl != null && photoUrl.isNotEmpty
              ? NetworkImage(photoUrl)
              : AssetImage("assets/images/default_avatar.png") as ImageProvider,
        ),
        SizedBox(width: 15),
        Text(name, style: TextStyle(color: Colors.white70)),
        SizedBox(width: 30),
      ],
    );
  }
}

class CrossStrikePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Color _getPlayerColor(dynamic colorValue) {
  if (colorValue is int) return Color(colorValue);
  return Colors.blue; // fallback color
}
