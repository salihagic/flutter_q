import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final favoriteMoviesProvider = StateNotifierProvider<FavoriteMovies, AsyncValue<GridResult<Movie>>>(
  (ref) {
    return FavoriteMovies(ref: ref);
  },
);

class FavoriteMovies extends StateNotifier<AsyncValue<GridResult<Movie>>> {
  final Ref ref;
  late IFavoritesRepository favoritesRepository;

  FavoriteMovies({
    required this.ref,
  }) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    favoritesRepository = await ref.read(favoritesRepositoryProvider.future);
    await load();
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
