import 'dart:async';

import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<AppCompleteStepEvent>(_completeStep);
  }

  Future<void> _completeStep(AppCompleteStepEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(steps: state.steps.addThen(event.step)));
  }
}
