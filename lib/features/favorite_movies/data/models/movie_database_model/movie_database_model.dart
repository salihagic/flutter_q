import 'package:flutter_q/_all.dart';
import 'package:hive/hive.dart';

part 'movie_database_model.g.dart';

@HiveType(typeId: 0)
class MovieDatabaseModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  bool adult;

  @HiveField(2)
  String backdropPath;

  @HiveField(3)
  List<int> genreIds;

  @HiveField(4)
  String originalLanguage;

  @HiveField(5)
  String originalTitle;

  @HiveField(6)
  String overview;

  @HiveField(7)
  double popularity;

  @HiveField(8)
  String posterPath;

  @HiveField(9)
  String releaseDate;

  @HiveField(10)
  String title;

  @HiveField(11)
  bool video;

  @HiveField(12)
  double voteAverage;

  @HiveField(13)
  int voteCount;

  MovieDatabaseModel({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDatabaseModel.fromMovie(Movie movie) {
    return MovieDatabaseModel(
      id: movie.id,
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIds: movie.genreIds,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
