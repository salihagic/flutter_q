import 'package:flutter_q/_all.dart';

GetIt services = GetIt.instance;
Environment environment = Environment.values[int.tryParse(const String.fromEnvironment('environment')) ?? Environment.production.index];

class Startup {
  static Future configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await RestApiClient.initFlutter();

    AppSettingsConfiguration.configure();
    CommonServicesConfiguration.configure();
    await StorageConfiguration.configure();
    await ApiClientConfiguration.configure();
    await RepositoriesConfiguration.configure();
    BlocsConfiguration.configure();
  }
}
