// ignore_for_file: always_use_package_imports

import 'package:flutter_q/_all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<State> with _$BaseState<State> {
  const BaseState._();

  const factory BaseState.initial() = _Initial;

  const factory BaseState.loading() = _Loading;

  const factory BaseState.data(State data) = _Data;

  const factory BaseState.error(Failure failure) = _Error;

  State? get data => whenOrNull(data: (data) => data);
}
