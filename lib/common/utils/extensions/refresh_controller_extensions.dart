import 'package:pull_to_refresh/pull_to_refresh.dart';

extension RefreshControllerExtensions on RefreshController {
  void complete() {
    if (isLoading) {
      loadComplete();
    } else if (isRefresh) {
      refreshCompleted();
    }
  }
}
