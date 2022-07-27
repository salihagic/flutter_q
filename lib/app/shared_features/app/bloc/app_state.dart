enum AppStep {
  loadGenres,
  // loadFavorites,
}

class AppState {
  List<AppStep> steps;
  double get percentage => (steps.length / AppStep.values.length) * 100;
  bool get isLoading => percentage < 100;

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
