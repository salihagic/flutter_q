// ignore_for_file: always_use_package_imports

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.empty() = _Empty;
}
