import 'package:bingo/repositary/screens/gameSettings/gameSettings.dart';
import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';

import '../card/win_or_lose/finishcard.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> numbers = List.generate(25, (index) => index + 1);
  bool showResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Gamesettings()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(children: [
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
                    fontWeight: FontWeight.w500),
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
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  child: Text("B"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  child: Text("I"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  child: Text("N"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  child: Text("G"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  child: Text("O"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: numbers.map((num) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff7e0aff),
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  '$num',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                    setState(() {
                                      showResult = true;
                                    });
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                child: Text("Confirm"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
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
                    border: Border.all(color: Colors.white24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "YOU LOSE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _RankCard("1st", "Player 3", Colors.redAccent),
                    _RankCard("2st", "Player 2", Colors.amber),
                    _RankCard("3rd", "Player 1", Colors.blue),
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
                        )),
                  ],
                ),
              ),
            ),
          ))
      ]),
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

  // 🔹 Player Row (with BINGO)
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
