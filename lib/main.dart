import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

Future main(args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await RestApiClient.initFlutter();

  final appSettings = AppSettingsConfiguration.configure();
  CommonServicesConfiguration.configure();
  await StorageConfiguration.configure();
  final restApiClient = await ApiClientConfiguration.configure(appSettings);
  await RepositoriesConfiguration.configure();
  final favoritesRepository = await RepositoriesConfiguration.configureFavoritesRepository();
  final moviesRepository = await RepositoriesConfiguration.configureMoviesRepository(restApiClient);
  BlocsConfiguration.configure();

  BlocOverrides.runZoned(
    () => runApp(
      ProviderScope(
        overrides: [
          appSettingsProvider.overrideWithValue(appSettings),
          restApiClientProvider.overrideWithValue(restApiClient),
          favoritesRepositoryProvider.overrideWithValue(favoritesRepository),
          moviesRepositoryProvider.overrideWithValue(moviesRepository),
        ],
        child: const App(),
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}
