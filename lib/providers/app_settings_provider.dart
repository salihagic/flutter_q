import 'package:flutter_q/_all.dart';

final appSettingsProvider = Provider<AppSettings>((ref) => throw UnimplementedError());

class AppSettingsConfiguration {
  static AppSettings configure() {
    switch (environment) {
      case Environment.development:
        services.registerSingleton<AppSettings>(developmentAppSettings);
        return developmentAppSettings;
      case Environment.staging:
        services.registerSingleton<AppSettings>(stagingAppSettings);
        return stagingAppSettings;
      case Environment.production:
        services.registerSingleton<AppSettings>(productionAppSettings);
        return productionAppSettings;
    }
  }
}
