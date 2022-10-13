import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/domain/notifiers/base_state.dart';
import 'package:flutter_q/common/domain/notifiers/base_state_notifier.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier, BaseState<List<Movie>, PopularMoviesState>>(
  (ref) => PopularMoviesStateNotifier(
    ref,
    popularMoviesRepositoryProvider: ref.read(popularMoviesRepositoryProvider),
  ),
);

class PopularMoviesStateNotifier
    extends BaseStateNotifier<List<Movie>, PopularMoviesState> {
  final PopularMoviesRepository popularMoviesRepositoryProvider;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepositoryProvider,
  }) {
    load(PopularMoviesSearchModel());
  }

  Future<void> load(PopularMoviesSearchModel model) async =>
      execute(popularMoviesRepositoryProvider.getPopular(model));

  Future<void> refresh(PopularMoviesSearchModel model) async => execute(
        popularMoviesRepositoryProvider.getPopular(model),
        withLoadingState: false,
      );

  Future<void> loadMore(PopularMoviesSearchModel model) async => execute(
        popularMoviesRepositoryProvider.getPopular(model),
        withLoadingState: false,
        onDataReceived: (items) {
          final currentItems = state.whenOrNull(data: (items) => items) ?? [];

          currentItems.addAll(items);

          state = BaseState.data(currentItems);

          return false;
        },
      );
}
