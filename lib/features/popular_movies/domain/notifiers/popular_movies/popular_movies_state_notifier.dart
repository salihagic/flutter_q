import 'package:dartz/dartz.dart';
import 'package:flutter_q/_all.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier,
    BaseState<BaseListState<PopularMoviesSearchModel, Movie>>>(
  (ref) => PopularMoviesStateNotifier(
    ref,
    popularMoviesRepositoryProvider: ref.read(popularMoviesRepositoryProvider),
  ),
);

class PopularMoviesStateNotifier
    extends BaseListStateNotifier<PopularMoviesSearchModel, Movie> {
  final PopularMoviesRepository popularMoviesRepositoryProvider;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepositoryProvider,
  });

  @override
  PopularMoviesSearchModel initialSearchModel() => PopularMoviesSearchModel();

  @override
  Future<Either<Failure, List<Movie>>> fetch(
    PopularMoviesSearchModel searchModel,
  ) =>
      popularMoviesRepositoryProvider.getPopular(searchModel);
}
