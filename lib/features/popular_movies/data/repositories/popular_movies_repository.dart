// ignore_for_file: avoid_print

import 'package:flutter_q/_all.dart';

final popularMoviesRepositoryProvider = Provider<PopularMoviesRepository>(
  (ref) => PopularMoviesRepositoryImpl(
    ref.read(apiClientProvider),
    ref.read(cacheHandlerProvider),
  ),
);

abstract class PopularMoviesRepository {
  FutureResult<List<Movie>> getPopular(
    PopularMoviesSearchModel model,
  );
}

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  final ApiClient _apiClient;
  final CacheHandler _cacheHandler;

  PopularMoviesRepositoryImpl(
    this._apiClient,
    this._cacheHandler,
  );

  @override
  FutureResult<List<Movie>> getPopular(
    PopularMoviesSearchModel model,
  ) async {
    final cacheKey = _cacheHandler.generateKey(
      ApiRoutes.getPopularMovies,
      model.toJson(),
    );

    try {
      final result = await _apiClient.getPopularMovies(model);

      await _cacheHandler.set(
        cacheKey,
        result.results.map((e) => e.toJson()).toList(),
      );

      return Result.network(
        result.results.map((x) => mapMovieResponseModelToMovie(x)).toList(),
      );
    } catch (e) {
      try {
        final cacheResult = await _cacheHandler.get(cacheKey);

        return Result.network(
          cacheResult
              .map((x) => MovieResponseModel.fromJson(x))
              .map<Movie>((x) => mapMovieResponseModelToMovie(x))
              .toList(),
        );
      } catch (e) {
        return Result.failure(Failure.generic(error: e));
      }
    }
  }
}
