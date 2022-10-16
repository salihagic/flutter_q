// ignore_for_file: avoid_print

import 'package:flutter_q/_all.dart';

final popularMoviesRepositoryProvider = Provider<PopularMoviesRepository>(
  (ref) => PopularMoviesRepositoryImpl(
    ref.read(apiClientProvider),
  ),
);

abstract class PopularMoviesRepository {
  StreamGridResult<Movie> getPopular(
    PopularMoviesSearchModel model,
  );
}

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  final IRestApiClient _apiClient;

  PopularMoviesRepositoryImpl(
    this._apiClient,
  );

  // This method yields 1 or 2 results depending if there is anything stored in the cache
  // First: Cache is checked and data is resolved/yielded/returned if there is any
  // Second: API request is awaited and possible outcome is either a success result with data or an error result with an exception
  // Caching is automatically implemented by RestApiClient which generated a cache key for each request by merging request data
  // like path, query parameters, body data, headers etc. and generates a hash from those values.
  // When the network request is successfull, response data is saved to cache storage and uniquely identified by previously generated key.
  // For each subsequent request, data will be autmatically updated in cache if new API data is available, and cache data will server it's purpose if
  // there is a network error or to optimize load times by initialy loading cached data an re-updating UI with network data when it is available.
  // This approach could be used on multiple parts of the app that does not required 100% data integrity at every moment.
  @override
  StreamGridResult<Movie> getPopular(
    PopularMoviesSearchModel model,
  ) {
    return _apiClient.getStreamed(
      '/3/movie/popular',
      queryParameters: model.toJson(),
      parser: (data) => GridResult(
        items: data['results']
            .map<Movie>(
              (map) => mapMovieResponseModelToMovie(
                MovieResponseModel.fromJson(Map<String, dynamic>.from(map)),
              ),
            )
            .toList(),
      ),
    );
  }

  // This is a basic method that tries to load a network result from the API
  // Possible outcome is either a success result with data or an error result with an exception
  // @override
  // FutureGridResult<Movie> getPopular(
  //   PopularMoviesSearchModel model,
  // ) async {
  //   return await _apiClient.get(
  //     '/3/movie/popular',
  //     queryParameters: model.toJson(),
  //     parser: (data) => GridResult(
  //       items: data['results']
  //           .map<Movie>(
  //             (map) => mapMovieResponseModelToMovie(
  //               MovieResponseModel.fromJson(Map<String, dynamic>.from(map)),
  //             ),
  //           )
  //           .toList(),
  //     ),
  //   );
  // }

  // This method only tries to load data from cache if there is any
  // Possible outcome is either a success result with data from cacge or an error result with an exception
  // @override
  // FutureGridResult<Movie> getPopularCached(
  //   PopularMoviesSearchModel model,
  // ) async {
  //   return await _apiClient.getCached(
  //     '/3/movie/popular',
  //     queryParameters: model.toJson(),
  //     parser: (data) => GridResult(
  //       items: data['results']
  //           .map<Movie>(
  //             (map) => mapMovieResponseModelToMovie(
  //               MovieResponseModel.fromJson(Map<String, dynamic>.from(map)),
  //             ),
  //           )
  //           .toList(),
  //     ),
  //   );
  // }
}
