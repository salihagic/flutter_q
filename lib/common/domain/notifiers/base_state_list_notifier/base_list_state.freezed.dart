// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseListState<TSearchModel extends Pagination, TItem> {
  GridResult<TItem> get data => throw _privateConstructorUsedError;
  TSearchModel get searchModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GridResult<TItem> data, TSearchModel searchModel)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GridResult<TItem> data, TSearchModel searchModel)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GridResult<TItem> data, TSearchModel searchModel)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<TSearchModel, TItem> value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<TSearchModel, TItem> value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<TSearchModel, TItem> value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseListStateCopyWith<TSearchModel, TItem,
          BaseListState<TSearchModel, TItem>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseListStateCopyWith<TSearchModel extends Pagination, TItem,
    $Res> {
  factory $BaseListStateCopyWith(BaseListState<TSearchModel, TItem> value,
          $Res Function(BaseListState<TSearchModel, TItem>) then) =
      _$BaseListStateCopyWithImpl<TSearchModel, TItem, $Res>;
  $Res call({GridResult<TItem> data, TSearchModel searchModel});
}

/// @nodoc
class _$BaseListStateCopyWithImpl<TSearchModel extends Pagination, TItem, $Res>
    implements $BaseListStateCopyWith<TSearchModel, TItem, $Res> {
  _$BaseListStateCopyWithImpl(this._value, this._then);

  final BaseListState<TSearchModel, TItem> _value;
  // ignore: unused_field
  final $Res Function(BaseListState<TSearchModel, TItem>) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? searchModel = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GridResult<TItem>,
      searchModel: searchModel == freezed
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as TSearchModel,
    ));
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<TSearchModel extends Pagination, TItem, $Res>
    implements $BaseListStateCopyWith<TSearchModel, TItem, $Res> {
  factory _$$_DataCopyWith(_$_Data<TSearchModel, TItem> value,
          $Res Function(_$_Data<TSearchModel, TItem>) then) =
      __$$_DataCopyWithImpl<TSearchModel, TItem, $Res>;
  @override
  $Res call({GridResult<TItem> data, TSearchModel searchModel});
}

/// @nodoc
class __$$_DataCopyWithImpl<TSearchModel extends Pagination, TItem, $Res>
    extends _$BaseListStateCopyWithImpl<TSearchModel, TItem, $Res>
    implements _$$_DataCopyWith<TSearchModel, TItem, $Res> {
  __$$_DataCopyWithImpl(_$_Data<TSearchModel, TItem> _value,
      $Res Function(_$_Data<TSearchModel, TItem>) _then)
      : super(_value, (v) => _then(v as _$_Data<TSearchModel, TItem>));

  @override
  _$_Data<TSearchModel, TItem> get _value =>
      super._value as _$_Data<TSearchModel, TItem>;

  @override
  $Res call({
    Object? data = freezed,
    Object? searchModel = freezed,
  }) {
    return _then(_$_Data<TSearchModel, TItem>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GridResult<TItem>,
      searchModel == freezed
          ? _value.searchModel
          : searchModel // ignore: cast_nullable_to_non_nullable
              as TSearchModel,
    ));
  }
}

/// @nodoc

class _$_Data<TSearchModel extends Pagination, TItem>
    implements _Data<TSearchModel, TItem> {
  const _$_Data(this.data, this.searchModel);

  @override
  final GridResult<TItem> data;
  @override
  final TSearchModel searchModel;

  @override
  String toString() {
    return 'BaseListState<$TSearchModel, $TItem>.data(data: $data, searchModel: $searchModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<TSearchModel, TItem> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.searchModel, searchModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(searchModel));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<TSearchModel, TItem, _$_Data<TSearchModel, TItem>>
      get copyWith => __$$_DataCopyWithImpl<TSearchModel, TItem,
          _$_Data<TSearchModel, TItem>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GridResult<TItem> data, TSearchModel searchModel)
        data,
  }) {
    return data(this.data, searchModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GridResult<TItem> data, TSearchModel searchModel)? data,
  }) {
    return data?.call(this.data, searchModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GridResult<TItem> data, TSearchModel searchModel)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data, searchModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<TSearchModel, TItem> value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<TSearchModel, TItem> value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<TSearchModel, TItem> value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<TSearchModel extends Pagination, TItem>
    implements BaseListState<TSearchModel, TItem> {
  const factory _Data(
          final GridResult<TItem> data, final TSearchModel searchModel) =
      _$_Data<TSearchModel, TItem>;

  @override
  GridResult<TItem> get data;
  @override
  TSearchModel get searchModel;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<TSearchModel, TItem, _$_Data<TSearchModel, TItem>>
      get copyWith => throw _privateConstructorUsedError;
}
