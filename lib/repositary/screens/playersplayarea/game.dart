import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> numbers = List.generate(25, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leading: IconButton(
            onPressed: () {},
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
      body: Padding(
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Player 2 :",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("B"),
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
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("I"),
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
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("N"),
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
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("G"),
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
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("O"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Player 3 :",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("B"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("I"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("N"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("G"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellowAccent, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("O"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Player 4 :",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("B"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("I"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("N"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("G"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text("O"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
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
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
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
    );
  }
}
