import 'package:my_little_app/features/genres/data/models/genre/genre_response_model.dart';
import 'package:my_little_app/features/genres/domain/entities/genre.dart';

List<GenreResponseModel> deserializeGenreResponseModelList(
  List<Map<String, dynamic>> json,
) =>
    json.map((e) => GenreResponseModel.fromJson(e)).toList();
List<Map<String, dynamic>> serializeGenreResponseModelList(
  List<GenreResponseModel> objects,
) =>
    objects.map((e) => e.toJson()).toList();

Genre mapGenreResponseModelToGenre(GenreResponseModel model) {
  return Genre(
    id: model.id,
    name: model.name,
  );
}
