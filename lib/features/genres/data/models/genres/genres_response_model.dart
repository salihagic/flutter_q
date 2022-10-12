import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_q/features/genres/data/models/genre/genre_response_model.dart';

part 'genres_response_model.g.dart';

@JsonSerializable()
class GenresResponseModel extends Equatable {
  final List<GenreResponseModel> genres;

  const GenresResponseModel({
    required this.genres,
  });

  factory GenresResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GenresResponseModelFromJson(data);

  GenresResponseModel copyWith({
    List<GenreResponseModel>? genres,
  }) {
    return GenresResponseModel(
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
        genres,
      ];

  Map<String, dynamic> toJson() => _$GenresResponseModelToJson(this);
}
