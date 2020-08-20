import 'package:flutter/widgets.dart';
import 'dart:convert';
import '../models/new_movie.dart';
import 'package:http/http.dart' as http;

class MoviesContainer with ChangeNotifier {
  List<NewMovieModel> movies = [];

  Future<void> getMovies() async {
    const url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=433a7df6fd627c1d28c5afcb99883ad3&language=en-US&page=1';
    final response = await http.get(url);
    print(response.body);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<NewMovieModel> loadedMovies = [];
    extractedData['results'].forEach((val) {
      loadedMovies.add(NewMovieModel(
          id: val['id'],
          title: val['title'],
          imageUrl: val['poster_path'],
          date: val['release_date']));
    });
    movies=loadedMovies;
    notifyListeners();
  }
}
