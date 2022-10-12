import 'package:dio/dio.dart';
import 'package:flutter_q/features/_all.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/token')
  Future<String> getToken();

  @GET('/3/genre/movie/list')
  Future<GenresResponseModel> getGenres();

  @GET('/3/movie/popular')
  Future<PopularMoviesResponseModel> getPopularMovies(
    @Queries() PopularMoviesSearchModel model,
  );
}
