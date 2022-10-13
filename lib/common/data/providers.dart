// ignore_for_file: always_use_package_imports

import 'package:dio/dio.dart';
import 'package:flutter_q/_all.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main/app_environment.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.read(
      _buildDioProviderWith(baseUrl: EnvInfo.apiBaseUrl),
    ),
  ),
);

Provider<Dio> _buildDioProviderWith({
  required String baseUrl,
}) {
  return Provider<Dio>(
    (ref) => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4',
        },
      ),
    )..interceptors.addAll(
        [
          PrettyDioLogger(requestHeader: true, requestBody: true),
        ],
      ),
  );
}
