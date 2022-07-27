extension AppIterableExtensions<T> on Iterable<T> {
  T? firstOrDefault([bool Function(T element)? test]) {
    if (test != null) {
      try {
        return firstWhere(test);
      } catch (e) {
        return null;
      }
    } else {
      try {
        return firstWhere((T element) => true);
      } catch (e) {
        return null;
      }
    }
  }
}

extension AppListExtensions<T> on List<T> {
  List<T> addThen(T element, [bool Function(T element)? test]) {
    final alreadyAdded = test != null ? firstOrDefault(test) != null : contains(element);

    if (!alreadyAdded) {
      add(element);
    }

    return this;
  }
}
