// ignore_for_file: constant_identifier_names
enum AppEnvironment {
  DEV(
    env: 'dev',
    appTitle: 'IMDB Q Dev',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
  ),
  PROD(
    env: 'prod',
    appTitle: 'IMDB Q Prod',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
  ),
  STAGING(
    env: 'staging',
    appTitle: 'IMDB Q Staging',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
  );

  final String env;
  final String appTitle;
  final String apiBaseUrl;
  final String assetBaseUrl;

  const AppEnvironment({
    required this.env,
    required this.appTitle,
    required this.apiBaseUrl,
    required this.assetBaseUrl,
  });
}

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get envName => _environment.env;

  static String get appTitle => _environment.appTitle;

  static String get assetBaseUrl => _environment.assetBaseUrl;

  static String get apiBaseUrl => _environment.apiBaseUrl;

  static AppEnvironment get environment => _environment;
}
