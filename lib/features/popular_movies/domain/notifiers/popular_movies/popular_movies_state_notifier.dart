import 'package:flutter_q/_all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_q/common/domain/notifiers/base_state.dart';
import 'package:flutter_q/common/domain/notifiers/base_state_notifier.dart';

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier, BaseState<List<Movie>, PopularMoviesState>>(
  (ref) => PopularMoviesStateNotifier(
    ref,
    moviesRepository: ref.read(moviesRepositoryProvider),
  ),
);

class PopularMoviesStateNotifier
    extends BaseStateNotifier<List<Movie>, PopularMoviesState> {
  final MoviesRepository moviesRepository;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.moviesRepository,
  });
}
