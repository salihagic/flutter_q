import 'package:flutter_q/_all.dart';

final navigationProvider =
    StateNotifierProvider<NavigationStateNotifier, NavigationState>(
  (ref) {
    return NavigationStateNotifier();
  },
);

class NavigationStateNotifier extends StateNotifier<NavigationState> {
  NavigationStateNotifier() : super(NavigationState(index: 0));

  void changeIndex({int index = 0, int subIndex = 0}) {
    state = NavigationState(index: index, subIndex: subIndex);
  }
}
