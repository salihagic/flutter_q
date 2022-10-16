import 'package:flutter_q/_all.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier, BaseState<PopularMoviesState>>(
  (ref) {
    return PopularMoviesStateNotifier(
      ref,
      popularMoviesRepository: ref.read(popularMoviesRepositoryProvider),
    );
  },
);

class PopularMoviesStateNotifier extends BaseStateNotifier<PopularMoviesState> {
  final PopularMoviesRepository popularMoviesRepository;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepository,
  });

  Future<void> load() async {
    final searchModel = PopularMoviesSearchModel();

    await execute<List<Movie>>(
      popularMoviesRepository.getPopular(searchModel),
      mapData: (items) => PopularMoviesState.data(items, searchModel),
      withLoadingState: false,
    );
  }

  Future<void> refresh() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.reset();

      await execute<List<Movie>>(
        popularMoviesRepository.getPopular(searchModel),
        withLoadingState: false,
        mapData: (items) => PopularMoviesState.data(items, searchModel),
      );
    }
  }

  Future<void> loadMore() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.increment();

      await execute<List<Movie>>(
        popularMoviesRepository.getPopular(searchModel),
        withLoadingState: false,
        mapData: (items) => PopularMoviesState.data(items, searchModel),
        onDataReceived: (data) {
          final newItems = data.items;
          final currentItems = List<Movie>.from(state.data?.items ?? []);
          currentItems.addAll(newItems);

          state = BaseState.data(
            PopularMoviesState.data(currentItems, searchModel),
          );

          return false;
        },
        onFailureOccurred: (failure) {
          searchModel.decrement();

          final currentItems = state.data?.items ?? [];

          state = BaseState.data(
            PopularMoviesState.data(currentItems, searchModel),
          );

          return true;
        },
      );
    }
  }
}
