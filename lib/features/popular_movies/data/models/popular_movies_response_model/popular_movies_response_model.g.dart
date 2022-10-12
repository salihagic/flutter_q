// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponseModel _$PopularMoviesResponseModelFromJson(
        Map<String, dynamic> json) =>
    PopularMoviesResponseModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularMoviesResponseModelToJson(
        PopularMoviesResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
