import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/data/providers.dart';

final movieDetailsRepositoryProvider = Provider<MovieDetailsRepository>(
  (ref) => MovieDetailsRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class MovieDetailsRepository {
  FutureResult<MovieDetails> getById(int id);
}

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final ApiClient _apiClient;

  MovieDetailsRepositoryImpl(this._apiClient);

  @override
  FutureResult<MovieDetails> getById(int id) async {
    try {
      final result = await _apiClient.getMovieById(id);

      return Result.network(mapMovieDetailsResponseModelToMovieDetails(result));
    } catch (e) {
      return Result.failure(Failure.generic(error: e));
    }
  }
}
