import 'package:bingo/repositary/screens/choose%20a%20room/chooseroom.dart';
import 'package:bingo/repositary/screens/room/room.dart';
import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class Joinroom extends StatefulWidget {
  @override
  State<Joinroom> createState() => _JoinroomState();
}

class _JoinroomState extends State<Joinroom> {
  TextEditingController roomIdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/nithish1.jpeg"),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                )
              ],
            ),
          )
        ],
        title: Uihelper.bingo(
          imgurl: "bingo.png",
          height: 40,
          width: 120,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff3A3A3A),
                    borderRadius: BorderRadius.circular(0)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Player",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Join a Room",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Uihelper.CustomTextField(
                        controller: roomIdcontroller,
                        text: "Enter room ID",
                        textinputtype: TextInputType.number,
                        context: context,
                        icondata: Icons.search,
                        onChanged: (value) {
                          print("Room ID entered: $value");
                        },
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: SizedBox(
                          height: 50,
                          width: 180,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (_) => Room()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
                              child: Text(
                                "Join",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
