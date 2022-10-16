// ignore_for_file: always_use_package_imports

import 'package:flutter_q/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_list_state.freezed.dart';

@freezed
class BaseListState<TSearchModel extends Pagination, TItem>
    with _$BaseListState<TSearchModel, TItem> {
  const factory BaseListState.data(
    GridResult<TItem> data,
    TSearchModel searchModel,
  ) = _Data;
}
