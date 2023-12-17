import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projek_uts/datadata.dart';
import 'package:projek_uts/login.dart';
import 'package:projek_uts/models/listhp.dart';
import 'package:projek_uts/profilepage.dart';
import 'package:projek_uts/viewmodels/fetch_data_hp.dart';
import 'package:projek_uts/sidebar.dart';

class apple extends StatefulWidget {
  const apple({
    super.key,
  });

  @override
  State<apple> createState() => _merekState();
}

class _merekState extends State<apple> {
  Repository repo = Repository();

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
                "A P P L E",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 239, 200, 128),
        ),
        body: Container(
            child: FutureBuilder<List<dynamic>>(
                future: repo.fetchDataHp(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> selectedData = snapshot.data
                        .where((data) => data.kategori == "Apple")
                        .toList();
                    // List<Hp> listHp = selectedData.map((iphone) {
                    //   return Hp.fromJson(iphone);
                    // }).toList();

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0),
                      itemCount: selectedData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  Image.network(
                                    snapshot.data[index].url,
                                    width: 100,
                                  ),
                                  Text(selectedData[index].kategori)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
