import 'package:flutter/cupertino.dart';

class Movie {
  final int id;
  final String name;
  final String imageUrl;

  Movie({required this.id, required this.name, required this.imageUrl});

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        imageUrl = json["poster"]["url"];
}
