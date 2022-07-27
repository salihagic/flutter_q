import 'package:flutter_q/_all.dart';

extension AppBuildContextX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}
