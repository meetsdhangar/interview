// To parse this JSON data, do
//
//     final homemodel = homemodelFromMap(jsonString);

import 'dart:convert';

List<Homemodel> homemodelFromMap(String str) =>
    List<Homemodel>.from(json.decode(str).map((x) => Homemodel.fromMap(x)));

String homemodelToMap(List<Homemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Homemodel {
  int userId;
  int id;
  String title;
  String body;

  Homemodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Homemodel.fromMap(Map<String, dynamic> json) => Homemodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
