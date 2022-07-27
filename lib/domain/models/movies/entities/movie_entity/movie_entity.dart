import 'package:flutter_q/_all.dart';
import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  bool? adult;

  @HiveField(2)
  String? backdropPath;

  @HiveField(3)
  List<int>? genreIds;

  @HiveField(4)
  String? originalLanguage;

  @HiveField(5)
  String? originalTitle;

  @HiveField(6)
  String? overview;

  @HiveField(7)
  double? popularity;

  @HiveField(8)
  String? posterPath;

  @HiveField(9)
  String? releaseDate;

  @HiveField(10)
  String? title;

  @HiveField(11)
  bool? video;

  @HiveField(12)
  double? voteAverage;

  @HiveField(13)
  int? voteCount;

  MovieEntity({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieEntity.fromMovie(Movie movie) {
    return MovieEntity(
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

  Movie toMovie() {
    return Movie(
      id: id,
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
