import 'package:flutter_q/_all.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (_) => throw UnimplementedError(),
);

abstract class FavoritesRepository {
  Future init();
  Future<List<Movie>> get();
  Future toggle(Movie movie);
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  late Box<MovieDatabaseModel> box;

  @override
  Future init() async {
    Hive.registerAdapter(MovieDatabaseModelAdapter());

    box = await Hive.openBox<MovieDatabaseModel>('favorites-box');
  }

  @override
  Future<List<Movie>> get() async {
    return box.values.map((x) => mapMovieDatabaseModelToMovie(x)).toList();
  }

  @override
  Future toggle(Movie movie) async {
    final movieDatabaseModel = mapMovieToMovieDatabaseModel(movie);

    final item = box.values.firstOrDefault((x) => x.id == movie.id);

    if (item == null) {
      await box.add(movieDatabaseModel);
    } else {
      await item.delete();
    }
  }
}
