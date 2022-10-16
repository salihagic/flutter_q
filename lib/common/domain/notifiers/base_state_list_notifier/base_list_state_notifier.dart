import 'dart:async';

import 'package:flutter_q/_all.dart';

/// [BaseListStateNotifier] is an abstraction of StateNotifier that implements:
/// - Easy to use infinite scrolling list mechanism (load, refresh and load more)
/// - Switch between there operation modes (FetchPolicy):
///   - FetchPolicy.network - load data only from network, works if you implement/override fetch method in the super class of this Notifier eg. Something extends BaseListStateNotifier<PopularMoviesSearchModel, Movie>
///   - FetchPolicy.cacheAndNetwork - load data both from network and cachd, it first fetches from cache while the network request is awaited. You get two state updates with this approach, be carefull.
///   - FetchPolicy.networkAndCacheOnError - Tries to load from network, if there is an error, then tries to load from cache if available

abstract class BaseListStateNotifier<TSearchModel extends Pagination, TItem>
    extends BaseStateNotifier<BaseListState<TSearchModel, TItem>> {
  final FetchPolicy fetchPolicy;

  BaseListStateNotifier(
    super.ref, {
    this.fetchPolicy = FetchPolicy.network,
  });

  TSearchModel initialSearchModel();

  FutureGridResult<TItem> fetch(TSearchModel searchModel) =>
      throw UnimplementedError();
  FutureGridResult<TItem> fetchCached(TSearchModel searchModel) =>
      throw UnimplementedError();
  StreamGridResult<TItem> fetchStreamed(TSearchModel searchModel) {
    throw UnimplementedError();
  }

  Future<void> load([TSearchModel? pSearchModel]) async {
    final searchModel = pSearchModel ?? initialSearchModel();

    switch (fetchPolicy) {
      case FetchPolicy.network:
        await execute<GridResult<TItem>>(
          fetch(searchModel),
          mapData: (result) => BaseListState.data(result.data!, searchModel),
          withLoadingState: false,
        );
        break;
      case FetchPolicy.cacheAndNetwork:
        await executeStreamed<GridResult<TItem>>(
          fetchStreamed(searchModel),
          mapData: (result) => BaseListState.data(result.data!, searchModel),
          withLoadingState: false,
        );
        break;
      case FetchPolicy.networkAndCacheOnError:
        await execute<GridResult<TItem>>(
          fetch(searchModel),
          mapData: (result) => BaseListState.data(result.data!, searchModel),
          withLoadingState: false,
          onFailureOccurred: (failure) async {
            await execute<GridResult<TItem>>(
              fetchCached(searchModel),
              mapData: (result) => BaseListState.data(
                result.data!
                    .copyWith(numberOfCachedItems: result.data!.items.length),
                searchModel,
              ),
            );

            return false;
          },
        );
        break;
    }
  }

  Future<void> refresh() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.reset();

      await load(searchModel);
    }
  }

  Future<void> loadMore() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.increment();

      FutureOr<bool> onDataReceived(
        BaseListState<TSearchModel, TItem> newState,
      ) {
        state = BaseState.data(
          BaseListState.data(newState.data, searchModel),
        );

        return false;
      }

      FutureOr<bool> onFailureOccurred(_) {
        state = BaseState.data(
          BaseListState.data(state.data!.data, searchModel),
        );

        return true;
      }

      BaseListState<TSearchModel, TItem> mapData(
        Result<GridResult<TItem>> result,
      ) {
        if (result is CacheResult) {
          final currentItems = List<TItem>.from(state.data?.data.items ?? []);
          currentItems.addAll(result.data?.items ?? []);

          final newState = BaseListState.data(
            result.data!.copyWith(
              numberOfCachedItems: state.data?.data.numberOfCachedItems,
              items: currentItems,
            ),
            searchModel,
          );

          return newState;
        } else {
          final currentItems = List<TItem>.from(state.data?.data.items ?? []);

          if ((state.data?.data.numberOfCachedItems ?? 0) > 0) {
            currentItems
                .removeLastItems(state.data?.data.numberOfCachedItems ?? 0);
          }

          currentItems.addAll(result.data?.items ?? []);

          final newState = BaseListState.data(
            result.data!.copyWith(
              numberOfCachedItems: 0,
              items: currentItems,
            ),
            searchModel,
          );

          return newState;
        }
      }

      switch (fetchPolicy) {
        case FetchPolicy.network:
          await execute<GridResult<TItem>>(
            fetch(searchModel),
            withLoadingState: false,
            mapData: mapData,
            onDataReceived: onDataReceived,
            onFailureOccurred: onFailureOccurred,
          );
          break;
        case FetchPolicy.cacheAndNetwork:
          await executeStreamed<GridResult<TItem>>(
            fetchStreamed(searchModel),
            withLoadingState: false,
            mapData: mapData,
            onDataReceived: onDataReceived,
            onFailureOccurred: onFailureOccurred,
          );
          break;
        case FetchPolicy.networkAndCacheOnError:
          await execute<GridResult<TItem>>(
            fetch(searchModel),
            withLoadingState: false,
            mapData: mapData,
            onDataReceived: onDataReceived,
            onFailureOccurred: (failure) async {
              final shouldHandle = onFailureOccurred.call(failure);

              execute<GridResult<TItem>>(
                fetchCached(searchModel),
                withLoadingState: false,
                mapData: mapData,
                onDataReceived: onDataReceived,
                onFailureOccurred: (_) => false,
              );

              return shouldHandle;
            },
          );
          break;
      }
    }
  }
}
