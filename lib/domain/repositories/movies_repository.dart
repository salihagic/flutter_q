import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final moviesRepositoryProvider = Provider<IMoviesRepository>((_) => throw UnimplementedError());

abstract class IMoviesRepository {
  Stream<Result<GridResult<Movie>>> getPopular(PopularMoviesSearchModel model);
}

class MoviesRepository implements IMoviesRepository {
  final IRestApiClient restApiClient;

  MoviesRepository({
    required this.restApiClient,
  });

  @override
  Stream<Result<GridResult<Movie>>> getPopular(PopularMoviesSearchModel model) async* {
    yield* restApiClient.getStreamed(
      '/3/movie/popular',
      queryParameters: model.toJson(),
      parser: (data) {
        final List<Movie> items = data['results'].map<Movie>((map) => Movie.fromJson(Map<String, dynamic>.from(map))).toList();

        return GridResult<Movie>(
          items: items,
          currentPage: data['page'],
          endPage: data['total_pages'],
          rowCount: data['total_results'],
        );
      },
    );
  }
}
