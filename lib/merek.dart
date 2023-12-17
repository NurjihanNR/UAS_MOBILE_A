import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_uts/login.dart';
import 'package:projek_uts/merek_apple.dart';
import 'package:projek_uts/profilepage.dart';
import 'package:projek_uts/sidebar.dart';

class merek extends StatefulWidget {
  const merek({super.key});

  @override
  State<merek> createState() => _merekState();
}

class _merekState extends State<merek> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => profilepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "K A T E G O R I",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 239, 200, 128),
      ),
      drawer: sidebar(
        onProfileTap: goToProfilePage,
        onSignOut: () {
          _auth.signOut();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const login()));
        },
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => apple()));
              },
              child: Container(
                width: 200.0,
                height: 150.0,
                child: Card(
                  elevation: 3,
                  child: Center(
                    child: Text("Apple"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
