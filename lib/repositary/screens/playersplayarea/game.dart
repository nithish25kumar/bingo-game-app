import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../splashpage/splashscreen.dart';

class Game extends StatefulWidget {
  final Color selectedColor;
  final int selectedTimer;
  final List<int> customBoard;

  const Game({
    super.key,
    required this.selectedColor,
    required this.selectedTimer,
    required this.customBoard,
  });

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
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
  }

  void checkBingo() {
    int lineCount = 0;
    List<bool> tempStrike = [false, false, false, false, false];

    // Check rows
    for (int i = 0; i < 5; i++) {
      if (selectedCells.sublist(i * 5, (i + 1) * 5).every((val) => val)) {
        lineCount++;
      }
    }

    // Check columns
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

    // Diagonals
    if ([0, 6, 12, 18, 24].every((i) => selectedCells[i])) lineCount++;
    if ([4, 8, 12, 16, 20].every((i) => selectedCells[i])) lineCount++;

    int newCompletedLines = lineCount.clamp(0, 5);

    for (int i = 0; i < newCompletedLines; i++) {
      tempStrike[i] = true;
    }

    setState(() {
      completedLines = newCompletedLines;
      bingoStrike = tempStrike;
      if (completedLines == 5) {
        showResult = true;
      }
    });
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                _buildPlayerRow("Player 2 :", Colors.red),
                SizedBox(height: 20),
                _buildPlayerRow("Player 3 :", Colors.yellowAccent),
                SizedBox(height: 20),
                _buildPlayerRow("Player 4 :", Colors.blue),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Container(
                    height: 460,
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
                          SizedBox(height: 20),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showResult = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: Text("Confirm"),
                              )
                            ],
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                          "YOU WIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _RankCard("1st", "You", Colors.green),
                        _RankCard("2nd", "Player 3", Colors.redAccent),
                        _RankCard("3rd", "Player 2", Colors.amber),
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

  Widget _buildPlayerRow(String name, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 10, backgroundColor: Colors.white),
        SizedBox(width: 15),
        Text(name, style: TextStyle(color: Colors.white70)),
        SizedBox(width: 20),
        ...['B', 'I', 'N', 'G', 'O'].map(
          (letter) => Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              child: Text(letter),
            ),
          ),
        ),
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
