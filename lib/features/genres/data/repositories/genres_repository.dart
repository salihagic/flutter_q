import 'package:dartz/dartz.dart';
import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/data/providers.dart';

final genresRepositoryProvider = Provider<GenresRepository>(
  (ref) => GenresRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class GenresRepository {
  EitherFailureOr<List<Genre>> get();
}

class GenresRepositoryImpl implements GenresRepository {
  final ApiClient _apiClient;

  GenresRepositoryImpl(
    this._apiClient,
  );

  @override
  EitherFailureOr<List<Genre>> get() async {
    try {
      final model = await _apiClient.getGenres();

      return Right(
        model.genres.map((x) => mapGenreResponseModelToGenre(x)).toList(),
      );
    } catch (e) {
      return Left(Failure.generic(error: e));
    }
  }
}
