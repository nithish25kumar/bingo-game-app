import 'dart:async';

import 'package:bingo/repositary/screens/splashpage/siginPage.dart';
import 'package:flutter/material.dart';

import '../selectmode/selectmode.dart' show Selectmode;
import '../widgets/uihelper.dart' show Uihelper;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Siginpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      body: Center(child: Uihelper.CustomImage2(imgurl: "splash.png")),
    );
  }
}
