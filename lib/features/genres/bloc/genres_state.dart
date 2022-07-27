import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class GenresState extends AbstractListState<Genre> {
  GenresState({
    required ResultStatus resultStatus,
    required GridResult<Genre> result,
  }) : super(
          resultStatus: resultStatus,
          result: result,
        );

  factory GenresState.initial() => GenresState(
        resultStatus: ResultStatus.loading,
        result: GridResult<Genre>(),
      );

  @override
  GenresState copyWith({
    ResultStatus? resultStatus,
    GridResult<Genre>? result,
  }) =>
      GenresState(
        resultStatus: resultStatus ?? this.resultStatus,
        result: result ?? this.result,
      );
}
