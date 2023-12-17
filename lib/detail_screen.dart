import 'package:flutter/material.dart';
import 'package:projek_uts/models/listhp.dart';

class detail extends StatelessWidget {
  final Hp place;

  const detail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 200, 128),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              place.nama,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(''),
            Image.network(place.url),
            Text(''),
            Text(
              place.nama,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(''),
            Text(place.deskripsi, textAlign: TextAlign.justify),
            Text(''),
            Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.monetization_on_sharp),
                Text(": "),
                Text(
                  place.harga,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Text(''),
            Text(''),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    print("pressed!");
                  },
                  child: Text('Beli Sekarang'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
