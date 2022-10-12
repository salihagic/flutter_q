import 'package:dartz/dartz.dart';
import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/data/providers.dart';

final moviesRepositoryProvider = Provider<MoviesRepository>(
  (ref) => MoviesRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class MoviesRepository {
  EitherFailureOr<List<Movie>> getPopular(
    PopularMoviesSearchModel model,
  );
}

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiClient _apiClient;

  MoviesRepositoryImpl(this._apiClient);

  @override
  EitherFailureOr<List<Movie>> getPopular(
    PopularMoviesSearchModel model,
  ) async {
    try {
      final result = await _apiClient.getPopularMovies(model);

      return Right(
        result.results.map((x) => mapMovieResponseModelToMovie(x)).toList(),
      );
    } catch (e) {
      return Left(Failure.generic(error: e));
    }
  }
}
