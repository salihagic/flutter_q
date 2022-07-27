import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_q/_all.dart';
import 'package:abstract_bloc/abstract_bloc.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityState.initial()) {
    on<ConnectivityUpdateEvent>(_update);

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((connectivityResult) {
      add(ConnectivityUpdateEvent(connectivityResult: connectivityResult));
    });
  }

  Future<void> _update(ConnectivityUpdateEvent event, Emitter<ConnectivityState> emit) async {
    emit(state.copyWith(connectivityResult: event.connectivityResult));
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();

    return super.close();
  }
}
