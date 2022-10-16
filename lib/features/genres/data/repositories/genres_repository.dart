import 'package:flutter_q/_all.dart';

final genresRepositoryProvider = Provider<GenresRepository>(
  (ref) => GenresRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class GenresRepository {
  FutureResult<List<Genre>> get();
}

class GenresRepositoryImpl implements GenresRepository {
  final IRestApiClient _apiClient;

  GenresRepositoryImpl(
    this._apiClient,
  );

  @override
  FutureResult<List<Genre>> get() async {
    return _apiClient.get(
      '/3/genre/movie/list',
      parser: (data) => data['genres']
          .map<GenreResponseModel>((map) =>
              GenreResponseModel.fromJson(Map<String, dynamic>.from(map)))
          .map<Genre>((x) => mapGenreResponseModelToGenre(x))
          .toList(),
    );
  }
}
