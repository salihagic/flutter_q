import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class PopularMoviesBloc extends AbstractListBloc<PopularMoviesState> {
  final IMoviesRepository moviesRepository;

  PopularMoviesBloc({
    required this.moviesRepository,
  }) : super(PopularMoviesState.initial());

  @override
  AbstractListState initialState() => PopularMoviesState.initial();

  @override
  Stream<Result> resolveStreamData() => moviesRepository.getPopular(state.searchModel);
}
