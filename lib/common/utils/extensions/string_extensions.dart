extension StringExtensions on String? {
  String get value => this ?? '';

  // String toNetworkImageUrl(AppSettings appSettings) => '${appSettings.baseImageUrl}$value';
}
