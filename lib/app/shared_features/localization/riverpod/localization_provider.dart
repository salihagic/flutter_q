import 'package:flutter_q/_all.dart';
import 'package:intl/intl.dart';

import 'dart:async';

final localizationProvider = StateNotifierProvider<LocalizationController, LocalizationState>(
  (ref) {
    return LocalizationController(
      restApiClient: ref.read(restApiClientProvider),
      storageRepository: ref.read(storageRepositoryProvider),
    );
  },
);

class LocalizationController extends StateNotifier<LocalizationState> {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;
  late StreamSubscription _restApiClientSubscription;

  LocalizationController({
    required this.restApiClient,
    required this.storageRepository,
  }) : super(LocalizationState.initial()) {
    _init();
  }

  Future<void> _init() async {
    String? languageCode = await storageRepository.get(AppKeys.language_code);
    final languagePreviouslySelected = languageCode != null;
    final locale = languagePreviouslySelected ? Locale(languageCode) : AppLanguages.values.first.locale;

    Intl.defaultLocale = locale.languageCode;
    restApiClient.setAcceptLanguageHeader(locale.languageCode);

    state = state.copyWith(status: languagePreviouslySelected ? LocalizationStateStatus.initialized : LocalizationStateStatus.initializedDefault, locale: locale);
  }

  Future<void> change(Locale locale) async {
    await storageRepository.set(AppKeys.language_code, locale.languageCode);

    restApiClient.setAcceptLanguageHeader(locale.languageCode);
    Intl.defaultLocale = locale.languageCode;

    state = state.copyWith(status: LocalizationStateStatus.changed, locale: locale);
    state = state.copyWith(status: LocalizationStateStatus.initialized);
  }

  @override
  void dispose() {
    _restApiClientSubscription.cancel();

    super.dispose();
  }
}
