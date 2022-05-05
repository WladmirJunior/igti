class Movie {
  String title;
  String overview;
  String backdropPath;

  Movie.fromJson(Map json)
      : title = json['original_title'],
        overview = json['overview'],
        backdropPath = json['backdrop_path'];

  @override
  String toString() {
    return '{title: $title, overview: $overview, backdropPath: $backdropPath}';
  }
}

class MovieData {
  int page;
  List<Movie> movies;

  MovieData(this.page, this.movies);

  factory MovieData.fromJson(Map json) {
    final page = json['page'] as int;
    final results = json['results'] as List<dynamic>;

    final movies = results.map((jsonMovie) => Movie.fromJson(jsonMovie)).toList();

    return MovieData(page, movies);


  }

  @override
  String toString() {
    return '{page: $page, results: $movies}';
  }
}