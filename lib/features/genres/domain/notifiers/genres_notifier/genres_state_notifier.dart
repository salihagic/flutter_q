import 'package:flutter_q/_all.dart';

final genresStateNotifierProvider =
    StateNotifierProvider<GenresStateNotifier, BaseState<List<Genre>>>(
  (ref) => GenresStateNotifier(
    ref,
    genresRepository: ref.read(genresRepositoryProvider),
  ),
);

class GenresStateNotifier extends BaseStateNotifier<List<Genre>> {
  final GenresRepository genresRepository;

  GenresStateNotifier(
    super.ref, {
    required this.genresRepository,
  }) {
    load();
  }

  Future<void> load() async => execute(genresRepository.get());
}
