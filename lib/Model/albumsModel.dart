// To parse this JSON data, do
//
//     final albumsmodel = albumsmodelFromMap(jsonString);

import 'dart:convert';

List<Albumsmodel> albumsmodelFromMap(String str) => List<Albumsmodel>.from(json.decode(str).map((x) => Albumsmodel.fromMap(x)));

String albumsmodelToMap(List<Albumsmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Albumsmodel {
    int userId;
    int id;
    String title;

    Albumsmodel({
        required this.userId,
        required this.id,
        required this.title,
    });

    factory Albumsmodel.fromMap(Map<String, dynamic> json) => Albumsmodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
