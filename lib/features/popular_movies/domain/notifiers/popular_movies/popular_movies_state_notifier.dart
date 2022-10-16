import 'package:flutter_q/_all.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier,
    BaseState<BaseListState<PopularMoviesSearchModel, Movie>>>(
  (ref) => PopularMoviesStateNotifier(
    ref,
    popularMoviesRepository: ref.read(popularMoviesRepositoryProvider),
  ),
);

class PopularMoviesStateNotifier
    extends BaseListStateNotifier<PopularMoviesSearchModel, Movie> {
  final PopularMoviesRepository popularMoviesRepository;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepository,
  });

  @override
  PopularMoviesSearchModel initialSearchModel() => PopularMoviesSearchModel();

  @override
  FutureResult<List<Movie>> fetch(
    PopularMoviesSearchModel searchModel,
  ) =>
      popularMoviesRepository.getPopular(searchModel);
}
