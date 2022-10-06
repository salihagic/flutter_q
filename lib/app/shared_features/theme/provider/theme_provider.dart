import 'package:flutter_q/_all.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeState>(
  (ref) {
    return ThemeController(storageRepository: ref.read(storageRepositoryProvider));
  },
);

class ThemeController extends StateNotifier<ThemeState> {
  final IStorageRepository storageRepository;

  ThemeController({
    required this.storageRepository,
  }) : super(ThemeState.initial()) {
    _init();
  }

  Future<void> _init() async {
    int? themeModeIndex = await storageRepository.get(AppKeys.theme_mode);

    change(themeModeIndex == null ? ThemeMode.light : ThemeMode.values[themeModeIndex]);
  }

  Future<void> change(ThemeMode themeMode) async {
    await storageRepository.set(AppKeys.theme_mode, themeMode.index);

    state = ThemeState(status: ThemeStateStatus.initialized, themeMode: themeMode);
  }
}
