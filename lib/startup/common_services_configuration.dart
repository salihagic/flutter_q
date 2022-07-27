import 'package:flutter_q/_all.dart';

class CommonServicesConfiguration {
  static void configure() {
    services.registerSingleton<IToast>(Toast());
  }
}
