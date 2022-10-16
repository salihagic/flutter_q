extension ListExtensions<T> on List<T> {
  List<T> addThen(T element, [bool Function(T element)? test]) {
    final alreadyAdded =
        test != null ? firstOrDefault(test) != null : contains(element);

    if (!alreadyAdded) {
      add(element);
    }

    return this;
  }

  void removeLastItems(int amount) {
    final end = length;
    final start = end - amount;

    removeRange(start >= 0 ? start : 0, end);
  }
}

extension IterableExtensions<T> on Iterable<T> {
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
