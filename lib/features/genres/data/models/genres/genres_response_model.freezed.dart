// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genres_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenresResponseModel _$GenresResponseModelFromJson(Map<String, dynamic> json) {
  return _GenresResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GenresResponseModel {
  List<Genre> get genres => throw _privateConstructorUsedError;
  set genres(List<Genre> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenresResponseModelCopyWith<GenresResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresResponseModelCopyWith<$Res> {
  factory $GenresResponseModelCopyWith(
          GenresResponseModel value, $Res Function(GenresResponseModel) then) =
      _$GenresResponseModelCopyWithImpl<$Res>;
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenresResponseModelCopyWithImpl<$Res>
    implements $GenresResponseModelCopyWith<$Res> {
  _$GenresResponseModelCopyWithImpl(this._value, this._then);

  final GenresResponseModel _value;
  // ignore: unused_field
  final $Res Function(GenresResponseModel) _then;

  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
abstract class _$$_GenresResponseModelCopyWith<$Res>
    implements $GenresResponseModelCopyWith<$Res> {
  factory _$$_GenresResponseModelCopyWith(_$_GenresResponseModel value,
          $Res Function(_$_GenresResponseModel) then) =
      __$$_GenresResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Genre> genres});
}

/// @nodoc
class __$$_GenresResponseModelCopyWithImpl<$Res>
    extends _$GenresResponseModelCopyWithImpl<$Res>
    implements _$$_GenresResponseModelCopyWith<$Res> {
  __$$_GenresResponseModelCopyWithImpl(_$_GenresResponseModel _value,
      $Res Function(_$_GenresResponseModel) _then)
      : super(_value, (v) => _then(v as _$_GenresResponseModel));

  @override
  _$_GenresResponseModel get _value => super._value as _$_GenresResponseModel;

  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_$_GenresResponseModel(
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenresResponseModel implements _GenresResponseModel {
  _$_GenresResponseModel({required this.genres});

  factory _$_GenresResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_GenresResponseModelFromJson(json);

  @override
  List<Genre> genres;

  @override
  String toString() {
    return 'GenresResponseModel(genres: $genres)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_GenresResponseModelCopyWith<_$_GenresResponseModel> get copyWith =>
      __$$_GenresResponseModelCopyWithImpl<_$_GenresResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenresResponseModelToJson(
      this,
    );
  }
}

abstract class _GenresResponseModel implements GenresResponseModel {
  factory _GenresResponseModel({required List<Genre> genres}) =
      _$_GenresResponseModel;

  factory _GenresResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GenresResponseModel.fromJson;

  @override
  List<Genre> get genres;
  set genres(List<Genre> value);
  @override
  @JsonKey(ignore: true)
  _$$_GenresResponseModelCopyWith<_$_GenresResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
