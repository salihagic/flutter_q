import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_q/_all.dart';

final connectivityProvider = StateNotifierProvider<ConnectivityController, ConnectivityState>(
  (ref) {
    return ConnectivityController();
  },
);

class ConnectivityController extends StateNotifier<ConnectivityState> {
  late StreamSubscription _connectivitySubscription;

  ConnectivityController() : super(ConnectivityState.initial()) {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((connectivityResult) {
      _update(connectivityResult);
    });
  }

  void _update(ConnectivityResult connectivityResult) {
    state = state.copyWith(connectivityResult: connectivityResult);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();

    super.dispose();
  }
}
