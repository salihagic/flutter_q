import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class PopularMoviesState {
  final ResultStatus resultStatus;
  final PopularMoviesSearchModel searchModel;
  final GridResult<Movie> result;

  PopularMoviesState({
    required this.resultStatus,
    required this.searchModel,
    required this.result,
  });

  factory PopularMoviesState.initial() => PopularMoviesState(
        resultStatus: ResultStatus.loading,
        searchModel: PopularMoviesSearchModel(),
        result: GridResult<Movie>(),
      );

  PopularMoviesState copyWith({
    ResultStatus? resultStatus,
    PopularMoviesSearchModel? searchModel,
    GridResult<Movie>? result,
  }) =>
      PopularMoviesState(
        resultStatus: resultStatus ?? this.resultStatus,
        searchModel: searchModel ?? this.searchModel,
        result: result ?? this.result,
      );
}
