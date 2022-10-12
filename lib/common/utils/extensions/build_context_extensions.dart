import 'package:flutter_q/_all.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  Orientation get orientation => mediaQuery.orientation;

  bool get isLandscape => (orientation == Orientation.landscape);
  bool get isPortrait => (orientation == Orientation.portrait);
}
