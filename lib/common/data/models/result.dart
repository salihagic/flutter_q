import 'package:flutter_q/_all.dart';

class Result<T> {
  T? data;
  Failure? failure;
  bool get hasData =>
      (data is List && (data as List).isNotEmpty) ||
      (data is! List && data != null);
  bool get isSuccess => !isError;
  bool get isError => failure != null;

  Result({
    this.data,
    this.failure,
  });

  factory Result.network(
    T? data,
  ) =>
      NetworkResult(
        data: data,
      );

  factory Result.cache(
    T? data,
  ) =>
      NetworkResult(
        data: data,
      );

  factory Result.data(
    T? data,
  ) =>
      DataResult(
        data: data,
      );

  factory Result.failure(
    Failure? failure,
  ) =>
      FailureResult(
        failure: failure,
      );
}

class NetworkResult<T> extends Result<T> {
  NetworkResult({
    T? data,
    Failure? failure,
    int? statusCode,
    String? statusMessage,
  }) : super(
          data: data,
          failure: failure,
        );
}

class CacheResult<T> extends Result<T> {
  CacheResult({
    T? data,
    Failure? failure,
  }) : super(
          data: data,
          failure: failure,
        );
}

class DataResult<T> extends Result<T> {
  DataResult({
    T? data,
  }) : super(
          data: data,
        );
}

class FailureResult<T> extends Result<T> {
  FailureResult({
    Failure? failure,
  }) : super(
          failure: failure,
        );
}
