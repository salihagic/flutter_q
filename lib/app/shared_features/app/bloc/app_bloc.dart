import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IGenresRepository genresRepository;

  late StreamSubscription _genresSubscription;

  AppBloc({
    required this.genresRepository,
  }) : super(AppState.initial()) {
    on<AppCompleteStepEvent>(_completeStep);

    _genresSubscription = genresRepository.genres.stream.listen((genres) {
      if (genres.isNotEmpty) {
        add(AppCompleteStepEvent(step: AppStep.loadGenres));
        _genresSubscription.cancel();
      }
    });
  }

  Future<void> _completeStep(AppCompleteStepEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(steps: state.steps.addThen(event.step)));
  }
}
