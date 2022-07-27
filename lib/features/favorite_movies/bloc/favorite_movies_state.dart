import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class FavoriteMoviesState extends AbstractListState<Movie> {
  FavoriteMoviesState({
    required ResultStatus resultStatus,
    required GridResult<Movie> result,
  }) : super(
          resultStatus: resultStatus,
          result: result,
        );

  factory FavoriteMoviesState.initial() => FavoriteMoviesState(
        resultStatus: ResultStatus.loading,
        result: GridResult<Movie>(),
      );

  @override
  FavoriteMoviesState copyWith({
    ResultStatus? resultStatus,
    GridResult<Movie>? result,
  }) =>
      FavoriteMoviesState(
        resultStatus: resultStatus ?? this.resultStatus,
        result: result ?? this.result,
      );
}
