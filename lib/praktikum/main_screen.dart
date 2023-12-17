import 'package:flutter/material.dart';
import 'package:projek_uts/login.dart';
import 'package:projek_uts/viewmodels/fetch_data_hp.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Repository repo = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HP LIST'),
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
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(snapshot.data[index].url),
                      ),
                      title: Text(snapshot.data[index].nama +
                          " " +
                          snapshot.data[index].deskripsi),
                      subtitle: Text(snapshot.data[index].harga),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
