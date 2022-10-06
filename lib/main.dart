import 'package:flutter_q/_all.dart';

Future main(args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await RestApiClient.initFlutter();

  final appSettings = AppSettingsConfiguration.configure();
  CommonServicesConfiguration.configure();
  final storageRepository = await StorageConfiguration.configure();
  final restApiClient = await ApiClientConfiguration.configure(appSettings);
  await RepositoriesConfiguration.configure();
  final favoritesRepository = await RepositoriesConfiguration.configureFavoritesRepository();
  final moviesRepository = await RepositoriesConfiguration.configureMoviesRepository(restApiClient);

  runApp(
    ProviderScope(
      overrides: [
        appSettingsProvider.overrideWithValue(appSettings),
        storageRepositoryProvider.overrideWithValue(storageRepository),
        restApiClientProvider.overrideWithValue(restApiClient),
        favoritesRepositoryProvider.overrideWithValue(favoritesRepository),
        moviesRepositoryProvider.overrideWithValue(moviesRepository),
      ],
      child: const App(),
    ),
  );
}
