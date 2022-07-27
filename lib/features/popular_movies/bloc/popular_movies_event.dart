import 'package:abstract_bloc/abstract_bloc.dart';

abstract class PopularMoviesEvent {}

class PopularMoviesLoadEvent extends AbstractListLoadEvent implements PopularMoviesEvent {}

class PopularMoviesRefreshEvent extends AbstractListRefreshEvent implements PopularMoviesEvent {}

class PopularMoviesLoadMoreEvent extends AbstractListLoadMoreEvent implements PopularMoviesEvent {}
