import 'dart:async';

import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final genresRepositoryProvider = Provider<IGenresRepository>(GenresRepository.new);

abstract class IGenresRepository {
  Future<Result<GridResult<Genre>>> get();
}

class GenresRepository implements IGenresRepository {
  final Ref ref;

  GenresRepository(this.ref);

  @override
  Future<Result<GridResult<Genre>>> get() async {
    final restApiClient = await ref.read(restApiClientProvider.future);

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
