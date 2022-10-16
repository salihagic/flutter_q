// ignore_for_file: always_use_package_imports, null_check_on_nullable_type_parameter

import 'dart:async';

import 'package:flutter_q/_all.dart';

typedef PreHandleData<T> = FutureOr<bool> Function(T data);
typedef PreHandleFailure = FutureOr<bool> Function(Failure failure);

abstract class BaseStateNotifier<DataState>
    extends StateNotifier<BaseState<DataState>> {
  final Ref ref;

  BaseStateNotifier(this.ref) : super(const BaseState.initial());

  /// Executes received [function] with additional parameters to control if loading state should be set while executing [function] by providing [withLoadingState] param.
  ///
  /// Also if you want loading shown over all screens, it can se set via [globalLoading] param.
  /// To show failure over all screens instead changing the state, it can be set via [globalFailure] params.
  /// To filter and control which data will update the state, [onDataReceived] callback can be passed. Alternatively,
  /// if callback always return false, custom data handling can be implemented.
  /// To filter and control which failure will update the state or be shown globally, [onFailureOccurred] callback can be
  /// passed. Similar to [onDataReceived] if always returned false, custom failure handling can be implemented.
  @protected
  Future execute<TData>(
    Future<Result<TData>> function, {
    DataState Function(Result<TData> data)? mapData,
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState = true,
    bool globalLoading = false,
    bool globalFailure = true,
  }) async {
    _setLoading(withLoadingState, globalLoading);
    final result = await function;

    if (result.isError) {
      await _onFailure(
        Failure.generic(uniqueKey: UniqueKey()),
        onFailureOccurred,
        withLoadingState,
        globalFailure,
      );
    } else {
      if (result.data != null) {
        await _onData(
          mapData?.call(result) ?? result.data as DataState,
          onDataReceived,
          withLoadingState,
        );
      }
    }
  }

  @protected
  Future executeStreamed<TData>(
    Stream<Result<TData>> function, {
    DataState Function(Result<TData> data)? mapData,
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState = true,
    bool globalLoading = false,
    bool globalFailure = true,
  }) async {
    _setLoading(withLoadingState, globalLoading);

    await for (final result in function) {
      if (result.isError) {
        await _onFailure(
          Failure.generic(uniqueKey: UniqueKey()),
          onFailureOccurred,
          withLoadingState,
          globalFailure,
        );
      } else {
        if (result.data != null) {
          await _onData(
            mapData?.call(result) ?? result.data as DataState,
            onDataReceived,
            withLoadingState,
          );
        }
      }
    }
  }

  ///Show [BaseLoadingIndicator] above the entire app
  @protected
  void showGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => true);

  ///Clear [BaseLoadingIndicator]
  @protected
  void clearGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => false);

  @protected
  void setGlobalFailure(Failure? failure) =>
      ref.read(globalFailureProvider.notifier).update((state) => failure);

  Future _onFailure(
    Failure failure,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState,
    bool globalFailure,
  ) async {
    final shouldProceedWithFailure =
        await onFailureOccurred?.call(failure) ?? true;
    if (!shouldProceedWithFailure || globalFailure) {
      _unsetLoading(withLoadingState);
    }
    if (shouldProceedWithFailure) {
      globalFailure
          ? setGlobalFailure(failure)
          : state = BaseState.error(failure);
    }
  }

  Future _onData(
    DataState data,
    PreHandleData<DataState>? onDataReceived,
    bool withLoadingState,
  ) async {
    final shouldUpdateState = await onDataReceived?.call(data) ?? true;
    _unsetLoading(shouldUpdateState ? false : withLoadingState);
    if (shouldUpdateState) {
      state = BaseState.data(data);
    }
  }

  ///Shows global loading if [globalLoading] == true
  ///Set [withLoadingState] == true if you want to change [BaseStateNotifier] state to [BaseState.loading]
  void _setLoading(bool withLoadingState, bool globalLoading) {
    if (withLoadingState) state = const BaseState.loading();
    if (globalLoading) showGlobalLoading();
  }

  ///Clears global loading
  ///Set [withLoadingState] == true if you want to reset [BaseStateNotifier] state to [BaseState.initial]
  void _unsetLoading(bool withLoadingState) {
    if (withLoadingState) state = const BaseState.initial();
    clearGlobalLoading();
  }
}
