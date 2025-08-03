import 'package:bingo/repositary/screens/selectmode/selectmode.dart';
import 'package:bingo/repositary/screens/splashpage/siginPage.dart';
import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  User? user = FirebaseAuth.instance.currentUser;
  String selectedCountry = 'India';
  List<String> countries = ['UAE', 'India', 'USA', 'Germany', 'Japan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF171717),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Selectmode()));
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white, // Border color
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.redAccent, width: 5)),
              child: CircleAvatar(
                  radius: 80,
                  backgroundImage: user?.photoURL != Null
                      ? NetworkImage(user!.photoURL!)
                      : AssetImage("assets/images/default_avatar.png")),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              user?.displayName != Null ? user!.displayName! : "Guest",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: Container(
                height: 35,
                width: 150,
                decoration: BoxDecoration(
                    color: Color(0xFF171717),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Text(
                        "1013842398",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.copy_all_rounded,
                            color: Colors.white,
                            size: 15,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                "Country",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 50,
                width: 250,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    dropdownColor: Color(0xFF2C2C2C),
                    iconEnabledColor: Colors.white54,
                    isExpanded: true,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    items: countries.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();

                    await GoogleSignIn().signOut();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Siginpage()),
                    );
                  } catch (e) {
                    Uihelper.showSnackBar(
                        context, "Logout failed ${e.toString()}");
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black),
                child: Text("Logout "))
          ],
        ),
      ),
    );
  }
}
