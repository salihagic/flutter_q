// ignore_for_file: constant_identifier_names
enum AppEnvironment {
  DEV(
    env: 'dev',
    appTitle: 'IMDB Q Dev',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
    networkImageBaseUrl: 'https://image.tmdb.org/t/p/w500',
  ),
  PROD(
    env: 'prod',
    appTitle: 'IMDB Q Prod',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
    networkImageBaseUrl: 'https://image.tmdb.org/t/p/w500',
  ),
  STAGING(
    env: 'staging',
    appTitle: 'IMDB Q Staging',
    apiBaseUrl: 'https://api.themoviedb.org',
    assetBaseUrl: 'assets/',
    networkImageBaseUrl: 'https://image.tmdb.org/t/p/w500',
  );

  final String env;
  final String appTitle;
  final String apiBaseUrl;
  final String assetBaseUrl;
  final String networkImageBaseUrl;

  const AppEnvironment({
    required this.env,
    required this.appTitle,
    required this.apiBaseUrl,
    required this.assetBaseUrl,
    required this.networkImageBaseUrl,
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

  static String get networkImageBaseUrl => _environment.networkImageBaseUrl;

  static AppEnvironment get environment => _environment;
}
