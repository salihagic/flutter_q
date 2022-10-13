import 'package:flutter_q/main/app_environment.dart';

extension StringExtensions on String? {
  String get value => this ?? '';

  String toNetworkImageUrl() => '${EnvInfo.networkImageBaseUrl}$value';
}
