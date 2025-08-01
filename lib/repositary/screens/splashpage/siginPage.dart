import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Siginpage extends StatefulWidget {
  const Siginpage({super.key});

  @override
  State<Siginpage> createState() => _SiginpageState();
}

class _SiginpageState extends State<Siginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Uihelper.bingo(imgurl: "bingo.png"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/google.webp",
                          height: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Google Sigin ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
