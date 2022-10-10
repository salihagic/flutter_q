// ignore_for_file: always_use_package_imports

import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_state.freezed.dart';

@freezed
class GenresState with _$GenresState {
  const factory GenresState.empty() = _Empty;
}
