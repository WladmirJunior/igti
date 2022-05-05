import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../domain/models/movie.dart';

class MovieService {
  static const key = '8b2f9af1b31654c53c407bb0c5731f1f';

  Future<List<Movie>> getMovies({int page = 1}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$key&page=$page');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return MovieData.fromJson(json).movies;
  }
}