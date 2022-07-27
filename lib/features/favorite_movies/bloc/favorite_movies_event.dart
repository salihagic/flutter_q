import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

abstract class FavoriteMoviesEvent {}

class FavoriteMoviesLoadEvent extends AbstractListLoadEvent implements FavoriteMoviesEvent {}

class FavoriteMoviesToggleEvent extends AbstractListLoadEvent implements FavoriteMoviesEvent {
  final Movie movie;

  FavoriteMoviesToggleEvent({required this.movie});
}
