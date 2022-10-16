import 'package:flutter_q/_all.dart';

// Example of BaseListStateNotifier usage here

final popularMoviesStateNotifierProvider = StateNotifierProvider<
    PopularMoviesStateNotifier,
    BaseState<BaseListState<PopularMoviesSearchModel, Movie>>>(
  (ref) => PopularMoviesStateNotifier(
    ref,
    popularMoviesRepositoryProvider: ref.read(popularMoviesRepositoryProvider),
  ),
);

class PopularMoviesStateNotifier
    extends BaseListStateNotifier<PopularMoviesSearchModel, Movie> {
  final PopularMoviesRepository popularMoviesRepositoryProvider;

  PopularMoviesStateNotifier(
    super.ref, {
    required this.popularMoviesRepositoryProvider,
    super.fetchPolicy = FetchPolicy.cacheAndNetwork,
  });

  // This is standard and should always be implemented
  @override
  PopularMoviesSearchModel initialSearchModel() => PopularMoviesSearchModel();

  // With this override we provide a way to fetch streamed data which coresponds to FetchPolicy.cacheAndNetwork
  // (load data both from network and cache, it first fetches from cache while the network request is awaited.
  // You get two state updates with this approach, be carefull.)
  @override
  StreamGridResult<Movie> fetchStreamed(
    PopularMoviesSearchModel searchModel,
  ) =>
      popularMoviesRepositoryProvider.getPopular(searchModel);

  // Implement this override if the FetchPolicy is network or networkAndCacheOnError, for more info see specific usage for each policy in the BaseListStateNotifier comments
  // @override
  // FutureGridResult<Movie> fetch(
  //   PopularMoviesSearchModel searchModel,
  // ) =>
  //     // getPopular method here needs to have a return type of FutureGridResult<Movie>
  //     popularMoviesRepositoryProvider.getPopular(searchModel);

  // Implement this override if the FetchPolicy is networkAndCacheOnError, for more info see specific usage for each policy in the BaseListStateNotifier comments
  // @override
  // FutureGridResult<Movie> fetch(
  //   PopularMoviesSearchModel searchModel,
  // ) =>
  //     // getPopular method here needs to have a return type of FutureGridResult<Movie>
  //     popularMoviesRepositoryProvider.getPopularCached(searchModel);
}
