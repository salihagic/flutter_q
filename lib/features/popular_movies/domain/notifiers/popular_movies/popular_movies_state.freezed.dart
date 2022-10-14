// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'popular_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PopularMoviesState {
  List<Movie> get items => throw _privateConstructorUsedError;
  PopularMoviesSearchModel get searchModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> items, PopularMoviesSearchModel searchModel)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> items, PopularMoviesSearchModel searchModel)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> items, PopularMoviesSearchModel searchModel)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopularMoviesStateCopyWith<PopularMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesStateCopyWith(
          PopularMoviesState value, $Res Function(PopularMoviesState) then) =
      _$PopularMoviesStateCopyWithImpl<$Res>;
  $Res call({List<Movie> items, PopularMoviesSearchModel searchModel});
}

/// @nodoc
class _$PopularMoviesStateCopyWithImpl<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  _$PopularMoviesStateCopyWithImpl(this._value, this._then);

  final PopularMoviesState _value;
  // ignore: unused_field
  final $Res Function(PopularMoviesState) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? searchModel = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      searchModel: searchModel == freezed
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as PopularMoviesSearchModel,
    ));
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> items, PopularMoviesSearchModel searchModel});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$PopularMoviesStateCopyWithImpl<$Res>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, (v) => _then(v as _$_Data));

  @override
  _$_Data get _value => super._value as _$_Data;

  @override
  $Res call({
    Object? items = freezed,
    Object? searchModel = freezed,
  }) {
    return _then(_$_Data(
      items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      searchModel == freezed
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as PopularMoviesSearchModel,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(final List<Movie> items, this.searchModel) : _items = items;

  final List<Movie> _items;
  @override
  List<Movie> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PopularMoviesSearchModel searchModel;

  @override
  String toString() {
    return 'PopularMoviesState.data(items: $items, searchModel: $searchModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other.searchModel, searchModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(searchModel));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Movie> items, PopularMoviesSearchModel searchModel)
        data,
  }) {
    return data(items, searchModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Movie> items, PopularMoviesSearchModel searchModel)?
        data,
  }) {
    return data?.call(items, searchModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Movie> items, PopularMoviesSearchModel searchModel)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(items, searchModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements PopularMoviesState {
  const factory _Data(
          final List<Movie> items, final PopularMoviesSearchModel searchModel) =
      _$_Data;

  @override
  List<Movie> get items;
  @override
  PopularMoviesSearchModel get searchModel;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
