import 'package:dio/dio.dart';
import 'package:my_little_app/features/genres/data/models/genres/genres_response_model.dart';
import 'package:my_little_app/features/genres/domain/entities/genre/genre.dart';
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

List<Genre> deserializeTaskList(List<Map<String, dynamic>> json) =>
    json.map((e) => Genre.fromJson(e)).toList();
List<Map<String, dynamic>> serializeTaskList(List<Genre> objects) =>
    objects.map((e) => e.toJson()).toList();
