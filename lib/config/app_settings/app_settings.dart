import 'package:flutter_q/_all.dart';

class AppSettings {
  final String baseApiUrl;
  final String baseImageUrl;
  final bool resetStorageOnRestart;
  final LoggingOptions loggingOptions;

  AppSettings({
    this.baseApiUrl = '<BASE_URL>',
    this.baseImageUrl = '<BASE_URL>',
    this.resetStorageOnRestart = false,
    this.loggingOptions = const LoggingOptions(
      logCacheStorage: false,
    ),
  });
}
