import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class GenresBloc extends AbstractListBloc<GenresState> {
  final IGenresRepository ganresRepository;

  GenresBloc({
    required this.ganresRepository,
  }) : super(GenresState.initial()) {
    add(AbstractListLoadEvent());
  }

  @override
  AbstractListState initialState() => GenresState.initial();

  @override
  Stream<Result> resolveStreamData() => ganresRepository.get();
}
