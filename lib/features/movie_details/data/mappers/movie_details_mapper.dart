import 'package:flutter_q/_all.dart';

MovieDetails mapMovieDetailsResponseModelToMovieDetails(
  MovieDetailsResponseModel model,
) {
  return MovieDetails(
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
