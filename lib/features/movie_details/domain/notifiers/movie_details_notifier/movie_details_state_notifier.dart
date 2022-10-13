import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/domain/notifiers/base_state.dart';
import 'package:flutter_q/common/domain/notifiers/base_state_notifier.dart';

final movieDetailsStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<MovieDetailsStateNotifier,
        BaseState<MovieDetails, MovieDetailsState>, int>(
  (ref, id) => MovieDetailsStateNotifier(
    ref,
    id: id,
    movieDetailsRepository: ref.read(movieDetailsRepositoryProvider),
  ),
);

class MovieDetailsStateNotifier
    extends BaseStateNotifier<MovieDetails, MovieDetailsState> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsStateNotifier(
    super.ref, {
    required int id,
    required this.movieDetailsRepository,
  }) {
    load(id);
  }

  Future<void> load(int id) async =>
      execute(movieDetailsRepository.getById(id));
}
