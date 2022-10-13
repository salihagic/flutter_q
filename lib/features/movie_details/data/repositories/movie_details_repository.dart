import 'package:dartz/dartz.dart';
import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/data/providers.dart';

final movieDetailsRepositoryProvider = Provider<MovieDetailsRepository>(
  (ref) => MovieDetailsRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class MovieDetailsRepository {
  EitherFailureOr<MovieDetails> getById(int id);
}

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final ApiClient _apiClient;

  MovieDetailsRepositoryImpl(this._apiClient);

  @override
  EitherFailureOr<MovieDetails> getById(int id) async {
    try {
      final result = await _apiClient.getById(id);

      return Right(mapMovieDetailsResponseModelToMovieDetails(result));
    } catch (e) {
      return Left(Failure.generic(error: e));
    }
  }
}
