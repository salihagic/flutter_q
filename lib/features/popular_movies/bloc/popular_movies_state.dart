import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class PopularMoviesState extends AbstractListFilterablePaginatedState<PopularMoviesSearchModel, Movie> {
  PopularMoviesState({
    required ResultStatus resultStatus,
    required PopularMoviesSearchModel searchModel,
    required GridResult<Movie> result,
  }) : super(
          resultStatus: resultStatus,
          searchModel: searchModel,
          result: result,
        );

  factory PopularMoviesState.initial() => PopularMoviesState(
        resultStatus: ResultStatus.loading,
        searchModel: PopularMoviesSearchModel(),
        result: GridResult<Movie>(),
      );

  @override
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
