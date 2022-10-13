// ignore_for_file: always_use_package_imports

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_movies_state.freezed.dart';

@freezed
class FavoriteMoviesState with _$FavoriteMoviesState {
  const factory FavoriteMoviesState.empty() = _Empty;
}
