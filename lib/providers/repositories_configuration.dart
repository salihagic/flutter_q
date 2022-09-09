import 'package:flutter_q/_all.dart';
import 'package:hive/hive.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    services.registerSingleton<IMoviesRepository>(
      MoviesRepository(
        restApiClient: services.get<IRestApiClient>(),
      ),
    );

    Hive.registerAdapter(MovieEntityAdapter());

    final favoritesRepository = FavoritesRepository();
    await favoritesRepository.init();

    services.registerSingleton<IFavoritesRepository>(
      favoritesRepository,
    );
  }
}
