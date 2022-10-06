import 'package:flutter_q/_all.dart';

final storageRepositoryProvider = Provider<IStorageRepository>((ref) => throw UnimplementedError());

class StorageConfiguration {
  static Future<IStorageRepository> configure() async {
    final storageRepository = SecureStorageRepository();
    await storageRepository.init();

    if (services.get<AppSettings>().resetStorageOnRestart) {
      await storageRepository.clear();
    }
    if (services.get<AppSettings>().loggingOptions.logStorage) {
      await storageRepository.log();
    }

    services.registerSingleton<IStorageRepository>(storageRepository);

    return storageRepository;
  }
}
