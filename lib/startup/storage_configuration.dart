import 'package:flutter_q/_all.dart';

class StorageConfiguration {
  static Future configure() async {
    final storageRepository = SecureStorageRepository();
    await storageRepository.init();

    if (services.get<AppSettings>().resetStorageOnRestart) {
      await storageRepository.clear();
    }
    if (services.get<AppSettings>().loggingOptions.logStorage) {
      await storageRepository.log();
    }

    services.registerSingleton<IStorageRepository>(storageRepository);
  }
}
