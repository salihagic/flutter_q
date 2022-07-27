import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

abstract class IGenresRepository {
  StreamController<List<Genre>> genres = StreamController<List<Genre>>.broadcast();

  Stream<Result<GridResult<Genre>>> get();
}

class GenresRepository implements IGenresRepository {
  final IRestApiClient restApiClient;
  @override
  StreamController<List<Genre>> genres = StreamController<List<Genre>>.broadcast();

  GenresRepository({required this.restApiClient});

  @override
  Stream<Result<GridResult<Genre>>> get() {
    return restApiClient.getStreamed(
      '/3/genre/movie/list',
      parser: (data) {
        final gridResult = GridResult<Genre>(
          items: data['genres']
              .map<Genre>(
                (map) => Genre.fromJson(Map<String, dynamic>.from(map)),
              )
              .toList(),
        );

        genres.add(gridResult.items);

        return gridResult;
      },
    );
  }
}
