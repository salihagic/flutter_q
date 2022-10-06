import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityState {
  ConnectivityResult connectivityResult;

  ConnectivityState({
    required this.connectivityResult,
  });

  factory ConnectivityState.initial() => ConnectivityState(connectivityResult: ConnectivityResult.none);

  ConnectivityState copyWith({
    ConnectivityResult? connectivityResult,
  }) =>
      ConnectivityState(
        connectivityResult: connectivityResult ?? this.connectivityResult,
      );
}
