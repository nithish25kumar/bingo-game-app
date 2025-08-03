import 'dart:math';

import 'package:bingo/repositary/screens/selectmode/selectmode.dart';
import 'package:bingo/repositary/screens/singleplayergame/customboard.dart';

import 'package:flutter/material.dart';
import '../multiplayer/multiplayer.dart';

class Gamesettingsingle extends StatefulWidget {
  const Gamesettingsingle({super.key});
  @override
  State<Gamesettingsingle> createState() => _GamesettingsingleState();
}

class _GamesettingsingleState extends State<Gamesettingsingle> {
  Color? selectedColor;
  int selectedTimer = 10;

  void _navigateToCustomizeBoard() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Customboard(
          selectedColor: selectedColor ?? Colors.deepPurpleAccent,
          selectedTimer: selectedTimer,
        ),
      ),
    );
  }

  Widget _colorOption(Color color) => GestureDetector(
        onTap: () => setState(() => selectedColor = color),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selectedColor == color
                  ? Colors.greenAccent
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: color,
            child: selectedColor == color
                ? Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
      );

  Widget _timerOption(int timer) => GestureDetector(
        onTap: () => setState(() => selectedTimer = timer),
        child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: selectedTimer == timer ? Colors.green : Colors.red,
                width: 2),
          ),
          child: Text("${timer}s", style: TextStyle(color: Colors.white)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Selectmode())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Host",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Game Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text("Choose your colour:",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(children: [
            _colorOption(Colors.deepPurpleAccent),
            _colorOption(Colors.pink),
            _colorOption(Colors.redAccent),
            _colorOption(Colors.green),
            _colorOption(Colors.orangeAccent),
          ]),
          SizedBox(height: 40),
          Text("Timer:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(children: [
            _timerOption(10),
            SizedBox(width: 10),
            _timerOption(20),
            SizedBox(width: 10),
            _timerOption(30)
          ]),
          SizedBox(
            height: 40,
          ),
          Spacer(),
          Center(
            child: SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: _navigateToCustomizeBoard,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff007ef3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("CONTINUE",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
