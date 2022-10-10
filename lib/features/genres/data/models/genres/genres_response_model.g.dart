// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenresResponseModel _$$_GenresResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_GenresResponseModel(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GenresResponseModelToJson(
        _$_GenresResponseModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
