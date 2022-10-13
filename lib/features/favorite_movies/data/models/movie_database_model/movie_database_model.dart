import 'package:hive/hive.dart';

part 'movie_database_model.g.dart';

@HiveType(typeId: 0)
class MovieDatabaseModel extends HiveObject {
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

  MovieDatabaseModel({
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
}
