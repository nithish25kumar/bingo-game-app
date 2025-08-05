import 'package:bingo/repositary/screens/selectmode/selectmode.dart';
import 'package:bingo/repositary/screens/widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Siginpage extends StatefulWidget {
  const Siginpage({super.key});

  @override
  State<Siginpage> createState() => _SiginpageState();
}

class _SiginpageState extends State<Siginpage>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> signInWithGoogle() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Selectmode()),
        );
        return;
      }

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Uihelper.showSnackBar(context, "Sign in aborted");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        final userDoc = _firestore.collection("users").doc(user.uid);
        final docSnapshot = await userDoc.get();

        if (!docSnapshot.exists) {
          await userDoc.set({
            "uid": user.uid,
            "name": user.displayName ?? "",
            "email": user.email ?? "",
            "photo": user.photoURL ?? "",
            "createdAt": FieldValue.serverTimestamp(),
          });
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Selectmode()),
        );
      }
    } catch (e) {
      Uihelper.showSnackBar(context, "Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.bingo(imgurl: "bingo.png"),
              const SizedBox(height: 30),
              const Text(
                "Welcome to Bingo!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sign in to continue playing 🎮",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 6,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google.webp",
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
