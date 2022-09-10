import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final favoriteMoviesProvider = StateNotifierProvider<FavoriteMovies, AsyncValue<GridResult<Movie>>>(
  (ref) {
    return FavoriteMovies(favoritesRepository: ref.read(favoritesRepositoryProvider));
  },
);

class FavoriteMovies extends StateNotifier<AsyncValue<GridResult<Movie>>> {
  final IFavoritesRepository favoritesRepository;

  FavoriteMovies({
    required this.favoritesRepository,
  }) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();

    final result = await favoritesRepository.get();

    if (result.hasData) {
      state = AsyncValue.data(result.data!);
    } else {
      state = AsyncValue.error(result.exception!);
    }
  }

  Future<void> toggle(Movie movie) async {
    await favoritesRepository.toggle(movie);

    await load();
  }
}
