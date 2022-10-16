import 'package:flutter_q/_all.dart';

abstract class BaseListStateNotifier<TSearchModel extends Pagination, TItem>
    extends BaseStateNotifier<BaseListState<TSearchModel, TItem>> {
  BaseListStateNotifier(super.ref);

  TSearchModel initialSearchModel();

  FutureResult<List<TItem>> fetch(TSearchModel searchModel);

  Future<void> load() async {
    final searchModel = initialSearchModel();

    await execute<List<TItem>>(
      fetch(searchModel),
      mapData: (items) => BaseListState.data(items, searchModel),
      withLoadingState: false,
    );
  }

  Future<void> refresh() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.reset();

      await execute<List<TItem>>(
        fetch(searchModel),
        withLoadingState: false,
        mapData: (items) => BaseListState.data(items, searchModel),
      );
    }
  }

  Future<void> loadMore() async {
    final searchModel = state.data?.searchModel;

    if (searchModel != null) {
      searchModel.increment();

      await execute<List<TItem>>(
        fetch(searchModel),
        withLoadingState: false,
        mapData: (items) => BaseListState.data(items, searchModel),
        onDataReceived: (data) {
          final newItems = data.items;
          final currentItems = List<TItem>.from(state.data?.items ?? []);
          currentItems.addAll(newItems);

          state = BaseState.data(
            BaseListState.data(currentItems, searchModel),
          );

          return false;
        },
        onFailureOccurred: (failure) {
          searchModel.decrement();

          final currentItems = state.data?.items ?? [];

          state = BaseState.data(
            BaseListState.data(currentItems, searchModel),
          );

          return true;
        },
      );
    }
  }
}
