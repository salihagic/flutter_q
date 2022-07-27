import 'package:flutter_q/_all.dart';

class BlocsConfiguration {
  static void configure() {
    configureSingletons();
    configureScoped();
  }

  static void configureSingletons() {
    services.registerSingleton(
      AppBloc(
        genresRepository: services.get<IGenresRepository>(),
      ),
    );
    services.registerSingleton(
      ConnectivityBloc(),
    );
    services.registerSingleton(
      LocalizationBloc(
        restApiClient: services.get<IRestApiClient>(),
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      ErrorHandlerBloc(
        restApiClient: services.get<IRestApiClient>(),
      ),
    );
    services.registerSingleton(
      NavigationBloc(),
    );
    services.registerSingleton(
      ThemeBloc(
        storageRepository: services.get<IStorageRepository>(),
      ),
    );
    services.registerSingleton(
      GenresBloc(
        ganresRepository: services.get<IGenresRepository>(),
      ),
    );
    services.registerSingleton(
      FavoriteMoviesBloc(
        favoritesRepository: services.get<IFavoritesRepository>(),
      ),
    );
  }

  static void configureScoped() {
    services.registerFactory(
      () => PopularMoviesBloc(
        moviesRepository: services.get<IMoviesRepository>(),
      ),
    );
  }
}
