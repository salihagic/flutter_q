import 'dart:async';

import 'package:flutter_q/_all.dart';

final errorHandlerProvider = StateNotifierProvider<ErrorHandlerController, ErrorHandlerState>(
  (ref) {
    return ErrorHandlerController(restApiClient: ref.read(restApiClientProvider));
  },
);

class ErrorHandlerController extends StateNotifier<ErrorHandlerState> {
  final IRestApiClient restApiClient;
  late StreamSubscription _restApiClientSubscription;

  ErrorHandlerController({
    required this.restApiClient,
  }) : super(ErrorHandlerState.initial()) {
    _restApiClientSubscription = restApiClient.exceptionHandler.exceptions.stream.listen((exception) {
      _addNewException(exception);
    });
  }

  void _addNewException(BaseException exception) {
    state = state.copyWith(
      status: ErrorHandlerStateStatus.dirty,
      exception: exception,
    );
  }

  @override
  void dispose() {
    _restApiClientSubscription.cancel();

    super.dispose();
  }
}
