import 'package:flutter_q/_all.dart';

final navigationProvider = StateNotifierProvider<NavigationController, NavigationState>(
  (ref) {
    return NavigationController();
  },
);

class NavigationController extends StateNotifier<NavigationState> {
  NavigationController() : super(NavigationState(index: 0));

  void changeIndex({int index = 0, int subIndex = 0}) {
    state = NavigationState(index: index, subIndex: subIndex);
  }
}
