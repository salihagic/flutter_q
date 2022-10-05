import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final popularMoviesProvider = StateNotifierProvider<PopularMovies, PopularMoviesState>(
  (ref) {
    return PopularMovies(moviesRepository: ref.read(moviesRepositoryProvider));
  },
);

class PopularMovies extends StateNotifier<PopularMoviesState> {
  final IMoviesRepository moviesRepository;

  PopularMovies({
    required this.moviesRepository,
  }) : super(PopularMoviesState.initial()) {
    load();
  }

  Future<void> load() async {
    state = state.copyWith(resultStatus: ResultStatus.loading);

    refresh();
  }

  Future<void> refresh() async {
    state.searchModel.reset();

    await for (final result in moviesRepository.getPopular(state.searchModel)) {
      if (result.hasData) {
        state = state.copyWith(result: result.data!);
      }
    }
  }
}
