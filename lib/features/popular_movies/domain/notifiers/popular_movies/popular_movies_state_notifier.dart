import 'package:flutter_q/_all.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier, BaseState<List<Movie>, PopularMoviesState>>(
  (ref) {
    return PopularMoviesStateNotifier(
      ref,
      popularMoviesRepositoryProvider:
          ref.read(popularMoviesRepositoryProvider),
    );
  },
);

class PopularMoviesStateNotifier
    extends BaseStateNotifier<List<Movie>, PopularMoviesState> {
  final PopularMoviesRepository popularMoviesRepositoryProvider;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepositoryProvider,
  }) {
    load();
  }

  Future<void> load() async {
    final searchModel = PopularMoviesSearchModel();
    searchModel.reset();

    await execute(
      popularMoviesRepositoryProvider.getPopular(searchModel),
      withLoadingState: false,
      onDataReceived: (items) {
        state = BaseState.other(PopularMoviesState.data(items, searchModel));

        return false;
      },
    );
  }

  Future<void> refresh() async {
    final searchModel = state.whenOrNull(
      other: (otherStates) => otherStates.searchModel,
    );
    if (searchModel != null) {
      searchModel.reset();

      await execute(
        popularMoviesRepositoryProvider.getPopular(searchModel),
        withLoadingState: false,
        onDataReceived: (items) {
          state = BaseState.other(PopularMoviesState.data(items, searchModel));

          return false;
        },
      );
    }
  }

  Future<void> loadMore() async {
    final searchModel = state.whenOrNull(
      other: (otherStates) => otherStates.searchModel,
    );

    if (searchModel != null) {
      searchModel.increment();

      execute(
        popularMoviesRepositoryProvider.getPopular(searchModel),
        withLoadingState: false,
        onDataReceived: (items) {
          final currentItems = state.whenOrNull(data: (items) => items) ?? [];
          debugPrint('SearchModel: ${searchModel.toJson()}');
          currentItems.addAll(items);

          state = BaseState.other(
            PopularMoviesState.data(currentItems, searchModel),
          );

          return false;
        },
        onFailureOccurred: (failure) {
          searchModel.decrement();

          debugPrint('SearchModel: ${searchModel.toJson()}');
          debugPrint('FAILURE');

          final currentItems = state.whenOrNull(
                other: (otherStates) => otherStates.items,
              ) ??
              [];

          state = BaseState.other(
            PopularMoviesState.data(currentItems, searchModel),
          );

          return true;
        },
      );
    }
  }
}
