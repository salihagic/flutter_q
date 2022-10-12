import 'package:equatable/equatable.dart';
import 'package:flutter_q/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies_response_model.g.dart';

@JsonSerializable()
class PopularMoviesResponseModel extends Equatable {
  final List<MovieResponseModel> result;

  const PopularMoviesResponseModel({
    required this.result,
  });

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> data) =>
      _$PopularMoviesResponseModelFromJson(data);

  PopularMoviesResponseModel copyWith({
    List<MovieResponseModel>? result,
  }) {
    return PopularMoviesResponseModel(
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
        result,
      ];

  Map<String, dynamic> toJson() => _$PopularMoviesResponseModelToJson(this);
}
