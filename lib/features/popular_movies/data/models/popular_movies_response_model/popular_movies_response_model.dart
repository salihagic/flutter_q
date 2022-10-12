import 'package:equatable/equatable.dart';
import 'package:flutter_q/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies_response_model.g.dart';

@JsonSerializable()
class PopularMoviesResponseModel extends Equatable {
  final List<MovieResponseModel> results;

  const PopularMoviesResponseModel({
    required this.results,
  });

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> data) =>
      _$PopularMoviesResponseModelFromJson(data);

  PopularMoviesResponseModel copyWith({
    List<MovieResponseModel>? results,
  }) {
    return PopularMoviesResponseModel(
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [
        results,
      ];

  Map<String, dynamic> toJson() => _$PopularMoviesResponseModelToJson(this);
}
