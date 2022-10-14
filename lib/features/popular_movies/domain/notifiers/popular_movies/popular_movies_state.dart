// ignore_for_file: always_use_package_imports

import 'package:flutter_q/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies_state.freezed.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.data(
    List<Movie> items,
    PopularMoviesSearchModel searchModel,
  ) = _Data;
}
