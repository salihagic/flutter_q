import 'package:flutter_q/_all.dart';

extension IToastBuildContextX on BuildContext {
  IToast get toast => services.get<IToast>();
}
