import 'dart:convert'; //melakukan decode atau encode
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projek_uts/models/listhp.dart';

class Repository {
  final String apiUrl =
      "https://apihpfirebase-default-rtdb.firebaseio.com/hpiphone.json";

  Future<List<Hp>> fetchDataHp() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Hp> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      dataPlaces = jsonData.values.map((value) {
        return Hp.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}
