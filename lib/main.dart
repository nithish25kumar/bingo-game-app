import 'package:bingo/repositary/screens/choose%20a%20room/chooseroom.dart';
import 'package:bingo/repositary/screens/gameSettings/customizeBoard.dart';
import 'package:bingo/repositary/screens/joinroom/joinroom.dart';
import 'package:bingo/repositary/screens/playersplayarea/game.dart';
import 'package:bingo/repositary/screens/room/room.dart';
import 'package:bingo/repositary/screens/splashpage/splashscreen.dart';
import 'package:bingo/repositary/screens/userprofile/userprofile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo-Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Game(),
    );
  }
}
