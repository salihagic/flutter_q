import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_little_app/common/data/api_client.dart';
import 'package:my_little_app/common/data/providers.dart';
import 'package:my_little_app/common/domain/either_failure_or.dart';
import 'package:my_little_app/common/domain/entities/failure.dart';
import 'package:my_little_app/features/genres/domain/entities/genre/genre.dart';

final genresRepositoryProvider = Provider<GenresRepository>(
  (ref) => GenresRepositoryImpl(
    apiClient: ref.read(apiClientProvider),
  ),
);

abstract class GenresRepository {
  EitherFailureOr<List<Genre>> get();
}

class GenresRepositoryImpl implements GenresRepository {
  final ApiClient apiClient;

  GenresRepositoryImpl({required this.apiClient});

  @override
  EitherFailureOr<List<Genre>> get() async {
    try {
      final model = await apiClient.getGenres();

      return Right(model.genres);
    } catch (e) {
      return Left(Failure.generic(error: e));
    }
  }
}
