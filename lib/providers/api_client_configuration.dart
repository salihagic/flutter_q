import 'package:flutter_q/_all.dart';

class ApiClientConfiguration {
  static Future configure() async {
    final IRestApiClient restApiClient = RestApiClient(
      options: RestApiClientOptions(
        baseUrl: services.get<AppSettings>().baseApiUrl,
        cacheEnabled: true,
      ),
      loggingOptions: services.get<AppSettings>().loggingOptions,
    );

    await restApiClient.init();

    restApiClient.authHandler.authorize(
      jwt: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4',
      refreshToken: '',
    );

    if (services.get<AppSettings>().resetStorageOnRestart) {
      await restApiClient.clearStorage();
    }

    services.registerSingleton<IRestApiClient>(restApiClient);
  }
}

final restApiClientProvider = FutureProvider<IRestApiClient>(
  (ref) async {
    final appSettings = ref.read(appSettingsProvider);

    final IRestApiClient restApiClient = RestApiClient(
      options: RestApiClientOptions(
        baseUrl: appSettings.baseApiUrl,
        cacheEnabled: true,
      ),
      loggingOptions: appSettings.loggingOptions,
    );

    await restApiClient.init();

    restApiClient.authHandler.authorize(
      jwt: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4',
      refreshToken: '',
    );

    if (appSettings.resetStorageOnRestart) {
      await restApiClient.clearStorage();
    }

    return restApiClient;
  },
);
