import 'package:flutter_q/_all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final popularMoviesFiltersStateNotifierProvider = StateNotifierProvider<
    PopularMoviesFiltersStateNotifier, PopularMoviesSearchModel>(
  (ref) => PopularMoviesFiltersStateNotifier(),
);

class PopularMoviesFiltersStateNotifier
    extends StateNotifier<PopularMoviesSearchModel> {
  PopularMoviesFiltersStateNotifier() : super(PopularMoviesSearchModel());

  void update(PopularMoviesSearchModel model) => state = model;
}
