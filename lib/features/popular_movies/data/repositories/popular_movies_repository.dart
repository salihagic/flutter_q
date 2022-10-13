import 'package:dartz/dartz.dart';
import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/data/providers.dart';

final popularMoviesRepositoryProvider = Provider<PopularMoviesRepository>(
  (ref) => PopularMoviesRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class PopularMoviesRepository {
  EitherFailureOr<List<Movie>> getPopular(
    PopularMoviesSearchModel model,
  );
}

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  final ApiClient _apiClient;

  PopularMoviesRepositoryImpl(this._apiClient);

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
