import 'package:flutter_q/_all.dart';

abstract class AppLanguages {
  static final List<LanguageModel> values = [
    LanguageModel(
      code: 'en',
      name: 'English',
      iconPath: AppAssets.images_flags_us_png,
    ),
    LanguageModel(
      code: 'bs',
      name: 'Bosanski',
      iconPath: AppAssets.images_flags_bs_png,
    ),
  ];
}
