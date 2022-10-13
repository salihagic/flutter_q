import 'package:flutter_q/_all.dart';

List<MovieResponseModel> deserializeMovieResponseModelList(
  List<Map<String, dynamic>> json,
) =>
    json.map((e) => MovieResponseModel.fromJson(e)).toList();
List<Map<String, dynamic>> serializeMovieResponseModelList(
  List<MovieResponseModel> objects,
) =>
    objects.map((e) => e.toJson()).toList();

Movie mapMovieResponseModelToMovie(MovieResponseModel model) {
  return Movie(
    id: model.id,
    adult: model.adult,
    backdropPath: model.backdropPath,
    genreIds: model.genreIds,
    originalLanguage: model.originalLanguage,
    originalTitle: model.originalTitle,
    overview: model.overview,
    popularity: model.popularity,
    posterPath: model.posterPath,
    releaseDate: model.releaseDate,
    title: model.title,
    video: model.video,
    voteAverage: model.voteAverage,
    voteCount: model.voteCount,
  );
}

Movie mapMovieDetailsToMovie(MovieDetails movieDetails) {
  return Movie(
    id: movieDetails.id,
    adult: movieDetails.adult,
    backdropPath: movieDetails.backdropPath,
    genreIds: movieDetails.genreIds,
    originalLanguage: movieDetails.originalLanguage,
    originalTitle: movieDetails.originalTitle,
    overview: movieDetails.overview,
    popularity: movieDetails.popularity,
    posterPath: movieDetails.posterPath,
    releaseDate: movieDetails.releaseDate,
    title: movieDetails.title,
    video: movieDetails.video,
    voteAverage: movieDetails.voteAverage,
    voteCount: movieDetails.voteCount,
  );
}
