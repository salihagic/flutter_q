import 'package:flutter_q/_all.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    services.registerSingleton<IMoviesRepository>(
      MoviesRepository(
        restApiClient: services.get<IRestApiClient>(),
      ),
    );
  }

  static Future<IFavoritesRepository> configureFavoritesRepository() async {
    final favoritesRepository = FavoritesRepository();
    await favoritesRepository.init();

    return favoritesRepository;
  }
}
