import 'package:flutter_q/_all.dart';

class RepositoriesConfiguration {
  static Future configure() async {
    services.registerSingleton<IMoviesRepository>(
      MoviesRepository(
        restApiClient: services.get<IRestApiClient>(),
      ),
    );
  }
}
