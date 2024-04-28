// To parse this JSON data, do
//
//     final todosmodel = todosmodelFromMap(jsonString);

import 'dart:convert';

List<Todosmodel> todosmodelFromMap(String str) => List<Todosmodel>.from(json.decode(str).map((x) => Todosmodel.fromMap(x)));

String todosmodelToMap(List<Todosmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Todosmodel {
    int userId;
    int id;
    String title;
    bool completed;

    Todosmodel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory Todosmodel.fromMap(Map<String, dynamic> json) => Todosmodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
