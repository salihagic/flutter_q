// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresResponseModel _$GenresResponseModelFromJson(Map<String, dynamic> json) =>
    GenresResponseModel(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresResponseModelToJson(
        GenresResponseModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
