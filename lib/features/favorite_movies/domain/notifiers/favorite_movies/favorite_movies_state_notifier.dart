import 'package:flutter_q/_all.dart';
import 'package:flutter_q/common/domain/notifiers/base_state.dart';
import 'package:flutter_q/common/domain/notifiers/base_state_notifier.dart';

final favoriteMoviesStateNotifierProvider = StateNotifierProvider<
    FavoriteMoviesStateNotifier, BaseState<List<Movie>, FavoriteMoviesState>>(
  (ref) => FavoriteMoviesStateNotifier(
    ref,
    favoritesRepository: ref.read(favoritesRepositoryProvider),
  ),
);

class FavoriteMoviesStateNotifier
    extends BaseStateNotifier<List<Movie>, FavoriteMoviesState> {
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
