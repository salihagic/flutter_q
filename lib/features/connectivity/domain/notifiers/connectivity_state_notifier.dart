import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectivityStateNotifierProvider =
    StateNotifierProvider<ConnectivityStateNotifier, ConnectivityResult?>(
  (ref) => ConnectivityStateNotifier(Connectivity()),
);

class ConnectivityStateNotifier extends StateNotifier<ConnectivityResult?> {
  final Connectivity _connectivity;

  ConnectivityStateNotifier(this._connectivity) : super(null) {
    init();
  }

  void init() => _connectivity.onConnectivityChanged.listen(
        (connectivityResult) {
          state = connectivityResult;
        },
      );
}
