import 'package:flutter_q/_all.dart';

enum ThemeStateStatus {
  initializing,
  initialized,
}

class ThemeState {
  ThemeStateStatus status;
  ThemeMode themeMode;

  ThemeState({
    required this.status,
    required this.themeMode,
  });

  factory ThemeState.initial() => ThemeState(
        status: ThemeStateStatus.initializing,
        themeMode: ThemeMode.light,
      );

  ThemeState copyWith({
    ThemeStateStatus? status,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
