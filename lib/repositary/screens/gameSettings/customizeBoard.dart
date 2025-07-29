import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Customizeboard extends StatefulWidget {
  const Customizeboard({super.key});

  @override
  State<Customizeboard> createState() => _CustomizeboardState();
}

class _CustomizeboardState extends State<Customizeboard> {
  List<int> numbers = List.generate(25, (index) => index + 1);

  void _shuffleBoard() {
    setState(() {
      numbers.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Host",
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Game Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 20),
            Container(
              height: 480,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff373c6d),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customize your board:",
                      style: TextStyle(color: Colors.white60, fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: numbers.map((num) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xff7e0aff),
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
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 130,
                          child: ElevatedButton(
                              onPressed: _shuffleBoard,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Text(
                                "Redo",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 130,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    )
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
