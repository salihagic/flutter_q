import 'package:dio/dio.dart';
import 'package:flutter_q/features/genres/data/models/genres/genres_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/token')
  Future<String> getToken();

  @GET('/3/genre/movie/list')
  Future<GenresResponseModel> getGenres();
}
