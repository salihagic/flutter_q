part of 'themes.dart';

final _theme = ThemeData();
final primaryTheme = ThemeData(
  primarySwatch: Colors.cyan,
  colorScheme: _theme.colorScheme.copyWith(secondary: Colors.cyan),
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.grey,
);
