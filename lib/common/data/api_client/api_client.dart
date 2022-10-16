import 'package:dio/dio.dart';
import 'package:flutter_q/_all.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiRoutes.getGenres)
  Future<GenresResponseModel> getGenres();

  @GET(ApiRoutes.getPopularMovies)
  Future<PopularMoviesResponseModel> getPopularMovies(
    @Queries() PopularMoviesSearchModel model,
  );

  @GET(ApiRoutes.getMovieById)
  Future<MovieDetailsResponseModel> getMovieById(@Path() int id);
}
