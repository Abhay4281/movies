
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Models/models.dart';

const apiKey = "add api key here";

class APIservices {
  final nowShowingAPI = "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final upComingApi = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApi = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final searchApi="https://api.themoviedb.org/3/discover/movie?api_key=$apiKey";

  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingAPI);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      for (var movie in movies) {
        print('Now Showing: ${movie.backdrop_path}');
      }
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
  Future<List<Movie>> searchMovies(String query) async {
    final searchUrl = "$searchApi&query=$query";
    Uri url = Uri.parse(searchUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      for (var movie in movies) {
        print('Search Result: ${movie.backdrop_path}');
      }
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movie>> getUpComing() async {
    Uri url = Uri.parse(upComingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      for (var movie in movies) {
        print('Upcoming: ${movie.backdrop_path}');
      }
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Movie>> getPopular() async {
    Uri url = Uri.parse(popularApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      for (var movie in movies) {
        print('Popular: ${movie.backdrop_path}');
      }
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
