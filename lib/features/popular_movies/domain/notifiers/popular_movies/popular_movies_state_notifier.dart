import 'package:flutter_q/_all.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier, BaseState<List<Movie>, PopularMoviesState>>(
  (ref) {
    return PopularMoviesStateNotifier(
      ref,
      popularMoviesRepository: ref.read(popularMoviesRepositoryProvider),
    );
  },
);

class PopularMoviesStateNotifier
    extends BaseStateNotifier<List<Movie>, PopularMoviesState> {
  final PopularMoviesRepository popularMoviesRepository;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepository,
  });

  Future<void> load() async {
    final searchModel = PopularMoviesSearchModel();
    searchModel.reset();

    await execute(
      popularMoviesRepository.getPopular(searchModel),
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
        popularMoviesRepository.getPopular(searchModel),
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

      await execute(
        popularMoviesRepository.getPopular(searchModel),
        withLoadingState: false,
        onDataReceived: (items) {
          final currentItems = List<Movie>.from(
            state.whenOrNull(
                  other: (otherStates) => otherStates.items,
                ) ??
                [],
          );
          currentItems.addAll(items);

          state = BaseState.other(
            PopularMoviesState.data(currentItems, searchModel),
          );

          return false;
        },
        onFailureOccurred: (failure) {
          searchModel.decrement();

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
