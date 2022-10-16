import 'package:flutter_q/_all.dart';

final movieDetailsStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<MovieDetailsStateNotifier, BaseState<MovieDetails>, int>(
  (ref, id) => MovieDetailsStateNotifier(
    ref,
    id: id,
    movieDetailsRepository: ref.read(movieDetailsRepositoryProvider),
  ),
);

class MovieDetailsStateNotifier extends BaseStateNotifier<MovieDetails> {
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
