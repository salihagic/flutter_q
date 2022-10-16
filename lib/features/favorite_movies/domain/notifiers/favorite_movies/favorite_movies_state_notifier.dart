import 'package:flutter_q/_all.dart';

final favoriteMoviesStateNotifierProvider =
    StateNotifierProvider<FavoriteMoviesStateNotifier, BaseState<List<Movie>>>(
  (ref) => FavoriteMoviesStateNotifier(
    ref,
    favoritesRepository: ref.read(favoritesRepositoryProvider),
  ),
);

class FavoriteMoviesStateNotifier extends BaseStateNotifier<List<Movie>> {
  final FavoritesRepository favoritesRepository;

  FavoriteMoviesStateNotifier(
    super.ref, {
    required this.favoritesRepository,
  }) {
    load();
  }

  Future<void> load() async => execute(
        favoritesRepository.get(),
        withLoadingState: false,
      );

  Future<void> toggle(Movie movie) async {
    await favoritesRepository.toggle(movie);

    await load();
  }
}
