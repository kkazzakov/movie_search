import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_search/domain/models/movie.dart';

class MovieRepo {
  var headers = {'X-API-KEY': 'F6N9F0K-8B0MP37-MRK2125-CAYT430'};

  Future<Movie> getRandomMovie() async {
    http.Response response = await http.get(
        Uri.parse("https://api.kinopoisk.dev/v1/movie/random"),
        headers: headers);
    Map<String, dynamic> singleMovieJson = jsonDecode(response.body);
    return Movie(
        id: singleMovieJson["id"],
        name: singleMovieJson["name"],
        imageUrl: singleMovieJson["poster"]["url"]);
  }

  Future<List<Movie>> searchByName({required name}) async {
    http.Response response = await http.get(
        Uri.parse("https://api.kinopoisk.dev/v1.3/movie?name=$name&limit=30"),
        headers: headers);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> moviesJson = jsonResponse['docs'];
    List<Movie> movies = moviesJson.map((movie) {
      return Movie(
          id: movie['id'],
          name: movie['name'],
          imageUrl: movie['poster']['previewUrl']);
    }).toList();

    return movies;
  }
}
