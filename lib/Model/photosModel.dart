// To parse this JSON data, do
//
//     final photosmodel = photosmodelFromMap(jsonString);

import 'dart:convert';

List<Photosmodel> photosmodelFromMap(String str) => List<Photosmodel>.from(json.decode(str).map((x) => Photosmodel.fromMap(x)));

String photosmodelToMap(List<Photosmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Photosmodel {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Photosmodel({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Photosmodel.fromMap(Map<String, dynamic> json) => Photosmodel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toMap() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
