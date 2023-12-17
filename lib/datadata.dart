import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_uts/detail_screen.dart';
import 'package:projek_uts/login.dart';
import 'package:projek_uts/merek.dart';
import 'package:projek_uts/profilepage.dart';
import 'package:projek_uts/sidebar.dart';
import 'package:projek_uts/viewmodels/fetch_data_hp.dart';

class data extends StatefulWidget {
  //data({super.key, required place});

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  Repository repo = Repository();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => profilepage()));
  }

  void goToMerekPage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => merek()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "E R I C E L L",
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const login()));
          },
          onKategori: goToMerekPage,
        ),
        body: Container(
            child: FutureBuilder<List<dynamic>>(
                future: repo.fetchDataHp(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      detail(place: snapshot.data[index])));
                            },
                            child: Card(
                              elevation: 3,
                              child: Row(
                                children: [
                                  Image.network(
                                    snapshot.data[index].url,
                                    width: 100,
                                  ),
                                  Text(snapshot.data[index].nama)
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
        
          
          // ListView(
               //children: dataList.map((tempat) {
          //   return GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).push(
          //           MaterialPageRoute(builder: (context) => detail(place: tempat)));
          //     },
          //     child: Card(
          //       elevation: 3,
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             tempat.imageAsset,
          //             width: 100,
          //           ),
          //           Text(tempat.name),
          //         ],
          //       ),
          //     ),
          //   );
          // }).toList()),
        
