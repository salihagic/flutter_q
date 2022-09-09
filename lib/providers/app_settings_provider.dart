import 'package:flutter_q/_all.dart';

class AppSettingsConfiguration {
  static void configure() {
    switch (environment) {
      case Environment.development:
        services.registerSingleton<AppSettings>(developmentAppSettings);
        break;
      case Environment.staging:
        services.registerSingleton<AppSettings>(stagingAppSettings);
        break;
      case Environment.production:
        services.registerSingleton<AppSettings>(productionAppSettings);
        break;
    }
  }
}

final appSettingsProvider = Provider<AppSettings>(
  (ref) {
    switch (environment) {
      case Environment.development:
        return developmentAppSettings;
      case Environment.staging:
        return stagingAppSettings;
      case Environment.production:
        return productionAppSettings;
    }
  },
);
