import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_response_model.g.dart';

@JsonSerializable()
class GenreResponseModel extends Equatable {
  final int id;
  final String name;

  const GenreResponseModel({
    required this.id,
    required this.name,
  });

  factory GenreResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GenreResponseModelFromJson(data);

  GenreResponseModel copyWith({
    int? id,
    String? name,
  }) {
    return GenreResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  Map<String, dynamic> toJson() => _$GenreResponseModelToJson(this);
}
