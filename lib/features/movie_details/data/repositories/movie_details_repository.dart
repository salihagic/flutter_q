import 'package:flutter_q/_all.dart';

final movieDetailsRepositoryProvider = Provider<MovieDetailsRepository>(
  (ref) => MovieDetailsRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class MovieDetailsRepository {
  FutureResult<MovieDetails> getById(int id);
}

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final IRestApiClient _apiClient;

  MovieDetailsRepositoryImpl(this._apiClient);

  @override
  FutureResult<MovieDetails> getById(int id) async {
    return await _apiClient.get(
      '/3/movie/$id',
      parser: (data) => mapMovieDetailsResponseModelToMovieDetails(
        MovieDetailsResponseModel.fromJson(data),
      ),
    );
  }
}
