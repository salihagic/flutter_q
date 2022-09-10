import 'dart:async';

import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final genresRepositoryProvider = Provider<IGenresRepository>(
  (ref) => GenresRepository(
    restApiClient: ref.read(restApiClientProvider),
  ),
);

abstract class IGenresRepository {
  Future<Result<GridResult<Genre>>> get();
}

class GenresRepository implements IGenresRepository {
  final IRestApiClient restApiClient;

  GenresRepository({required this.restApiClient});

  @override
  Future<Result<GridResult<Genre>>> get() async {
    return restApiClient.get(
      '/3/genre/movie/list',
      parser: (data) {
        final gridResult = GridResult<Genre>(
          items: data['genres']
              .map<Genre>(
                (map) => Genre.fromJson(Map<String, dynamic>.from(map)),
              )
              .toList(),
        );

        return gridResult;
      },
    );
  }
}
