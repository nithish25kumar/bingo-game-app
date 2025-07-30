import 'package:bingo/repositary/screens/gameSettings/customizeBoard.dart';
import 'package:flutter/material.dart';

class Gamesettings extends StatefulWidget {
  const Gamesettings({super.key});

  @override
  State<Gamesettings> createState() => _GamesettingsState();
}

class _GamesettingsState extends State<Gamesettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Customizeboard()));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Host",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Game Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Choose your colour :",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.pink,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.yellowAccent,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.orangeAccent,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Timer :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "10s",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "20s",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "30s",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Board settings : ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Column(
                    children: [
                      Text(
                        "Randomize",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Column(
                    children: [
                      Text(
                        "Customize",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff007ef3),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Column(
                      children: [Text("Invite Others")],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
