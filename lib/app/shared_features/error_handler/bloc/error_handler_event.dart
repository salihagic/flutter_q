import 'package:flutter_q/_all.dart';

abstract class ErrorHandlerEvent {}

class ErrorHandlerAddNewExceptionEvent extends ErrorHandlerEvent {
  final BaseException exception;

  ErrorHandlerAddNewExceptionEvent({required this.exception});
}
