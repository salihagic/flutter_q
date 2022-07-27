import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityEvent {}

class ConnectivityUpdateEvent extends ConnectivityEvent {
  final ConnectivityResult connectivityResult;

  ConnectivityUpdateEvent({required this.connectivityResult});
}
