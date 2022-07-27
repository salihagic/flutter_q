import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class FavoriteMoviesBloc extends AbstractListBloc<FavoriteMoviesState> {
  final IFavoritesRepository favoritesRepository;

  FavoriteMoviesBloc({
    required this.favoritesRepository,
  }) : super(FavoriteMoviesState.initial()) {
    on<FavoriteMoviesToggleEvent>(_toggle);

    add(FavoriteMoviesLoadEvent());
  }

  @override
  AbstractListState initialState() => FavoriteMoviesState.initial();

  @override
  Future<Result> resolveData() => favoritesRepository.get();

  Future<void> _toggle(FavoriteMoviesToggleEvent event, Emitter<FavoriteMoviesState> emit) async {
    await favoritesRepository.toggle(event.movie);

    add(FavoriteMoviesLoadEvent());
  }
}
