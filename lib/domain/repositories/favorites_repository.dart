import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';
import 'package:hive/hive.dart';

abstract class IFavoritesRepository {
  Future init();
  Future<Result<GridResult<Movie>>> get();
  Future toggle(Movie movie);
}

class FavoritesRepository implements IFavoritesRepository {
  late Box<MovieEntity> box;

  @override
  Future init() async {
    box = await Hive.openBox<MovieEntity>('favorites-box');
  }

  @override
  Future<Result<GridResult<Movie>>> get() async {
    return Result.success(
      data: GridResult(
        items: box.values.map((x) => x.toMovie()).toList(),
      ),
    );
  }

  @override
  Future toggle(Movie movie) async {
    final item = box.values.firstOrDefault((x) => x.id == movie.id);

    if (item == null) {
      await box.add(MovieEntity.fromMovie(movie));
    } else {
      await item.delete();
    }
  }
}
