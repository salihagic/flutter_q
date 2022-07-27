import 'package:flutter_q/_all.dart';

abstract class AppEvent {}

class AppCompleteStepEvent extends AppEvent {
  final AppStep step;

  AppCompleteStepEvent({required this.step});
}
