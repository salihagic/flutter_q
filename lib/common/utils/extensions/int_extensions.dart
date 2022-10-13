extension IntExtensions on int? {
  int get value => this ?? 0;
  bool get hasValue => this != null;
}
