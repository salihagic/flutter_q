import 'package:flutter_q/_all.dart';

AppSettings productionAppSettings = AppSettings(
  baseApiUrl: 'https://api.themoviedb.org',
  baseImageUrl: 'https://image.tmdb.org/t/p/w500',
  loggingOptions: const LoggingOptions(
    // Make sure to set these values to false in real Production evironment
    logNetworkTraffic: true,
    logCacheStorage: false,
    logStorage: false,
  ),
);
