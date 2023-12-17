import 'dart:convert';

Hp hpFromJson(String str) => Hp.fromJson(json.decode(str));

String hpToJson(Hp data) => json.encode(data.toJson());

class Hp {
  String deskripsi;
  String harga;
  String kategori;
  String nama;
  String url;

  Hp({
    required this.deskripsi,
    required this.harga,
    required this.kategori,
    required this.nama,
    required this.url,
  });

  factory Hp.fromJson(Map<String, dynamic> json) => Hp(
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        kategori: json["kategori"],
        nama: json["nama"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "deskripsi": deskripsi,
        "harga": harga,
        "kategori": kategori,
        "nama": nama,
        "url": url,
      };
}
