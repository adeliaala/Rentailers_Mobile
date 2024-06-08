import 'dart:convert';

List<MobilSayaModel> mobilSayaModelFromJson(String str) =>
    List<MobilSayaModel>.from(
        json.decode(str).map((x) => MobilSayaModel.fromJson(x)));

String mobilSayaModelToJson(List<MobilSayaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MobilSayaModel {
  final String nopol;
  final String merkmobil;
  final int harga;
  final String type;
  final String status;
  final String gambar;
  final String deskripsi;
  final DateTime createdAt;
  final DateTime updatedAt;

  MobilSayaModel({
    required this.nopol,
    required this.merkmobil,
    required this.harga,
    required this.type,
    required this.status,
    required this.gambar,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MobilSayaModel.fromJson(Map<String, dynamic> json) => MobilSayaModel(
        nopol: json["nopol"],
        merkmobil: json["merkmobil"],
        harga: json["harga"],
        type: json["type"],
        status: json["status"],
        gambar: json["gambar"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nopol": nopol,
        "merkmobil": merkmobil,
        "harga": harga,
        "type": type,
        "status": status,
        "gambar": gambar,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
