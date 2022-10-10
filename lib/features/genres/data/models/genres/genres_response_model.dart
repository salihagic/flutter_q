import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_little_app/features/genres/domain/entities/genre/genre.dart';

part 'genres_response_model.freezed.dart';
part 'genres_response_model.g.dart';

@unfreezed
class GenresResponseModel with _$GenresResponseModel {
  factory GenresResponseModel({
    required List<Genre> genres,
  }) = _GenresResponseModel;

  factory GenresResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseModelFromJson(json);
}
