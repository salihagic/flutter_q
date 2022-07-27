import 'package:flutter_q/config/app_settings/app_settings.dart';

extension AppStringNullableExtensions on String? {
  String get value => this ?? '';

  String toNetworkImageUrl(AppSettings appSettings) => '${appSettings.baseImageUrl}$value';
}
