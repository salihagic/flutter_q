import 'package:flutter_q/_all.dart';

extension L10nBuildContextX on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
}
