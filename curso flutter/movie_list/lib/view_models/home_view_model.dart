import 'dart:async';

import 'package:movie_list/services/movie_service.dart';

import '../domain/models/movie.dart';

class HomeViewModel {
  MovieService _service = MovieService();

  int _currentPage = 1;
  List<Movie> _listMovies = [];

  final streamController = StreamController<List<Movie>>();

  void getMovies() {
    _service.getMovies(page: _currentPage).then((movies) {
      _listMovies.addAll(movies);
      streamController.sink.add(_listMovies);
      _currentPage++;
    });
  }
}