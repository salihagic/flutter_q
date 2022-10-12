import 'package:flutter_q/_all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final moviesRepositoryProvider =
    Provider<MoviesRepository>((_) => throw UnimplementedError());

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
        result.result.map((x) => mapMovieResponseModelToMovie(x)).toList(),
      );
    } catch (e) {
      return Left(Failure.generic(error: e));
    }
  }
}
