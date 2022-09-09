enum AppStep {
  loadGenres,
}

class AppState {
  List<AppStep> steps;
  double get percentage => 100;
  bool get isLoading => false;

  AppState({required this.steps});

  factory AppState.initial() => AppState(
        steps: <AppStep>[],
      );

  AppState copyWith({
    List<AppStep>? steps,
  }) {
    return AppState(
      steps: steps ?? this.steps,
    );
  }
}
