import 'package:flutter_q/_all.dart';

final genresRepositoryProvider = Provider<GenresRepository>(
  (ref) => GenresRepositoryImpl(
    ref.read(apiClientProvider),
    ref.read(cacheHandlerProvider),
  ),
);

abstract class GenresRepository {
  FutureResult<List<Genre>> get();
}

class GenresRepositoryImpl implements GenresRepository {
  final ApiClient _apiClient;
  final CacheHandler _cacheHandler;

  GenresRepositoryImpl(
    this._apiClient,
    this._cacheHandler,
  );

  @override
  FutureResult<List<Genre>> get() async {
    final cacheKey = _cacheHandler.generateKey(ApiRoutes.getGenres);

    try {
      final result = await _apiClient.getGenres();

      await _cacheHandler.set(
        cacheKey,
        result.genres.map((e) => e.toJson()).toList(),
      );

      return Result.network(
        result.genres.map((x) => mapGenreResponseModelToGenre(x)).toList(),
      );
    } catch (e) {
      try {
        final cacheResult = await _cacheHandler.get(cacheKey);

        return Result.network(
          cacheResult
              .map((x) => GenreResponseModel.fromJson(x))
              .map<Genre>((x) => mapGenreResponseModelToGenre(x))
              .toList(),
        );
      } catch (e) {
        return Result.failure(Failure.generic(error: e));
      }
    }
  }
}
