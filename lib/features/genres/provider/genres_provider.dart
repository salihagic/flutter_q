import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

final genresProvider = StateNotifierProvider<Genres, AsyncValue<GridResult<Genre>>>((ref) {
  return Genres(genresRepository: ref.read(genresRepositoryProvider));
});

class Genres extends StateNotifier<AsyncValue<GridResult<Genre>>> {
  final IGenresRepository genresRepository;

  Genres({
    required this.genresRepository,
  }) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();

    final result = await genresRepository.get();

    if (result.hasData) {
      state = AsyncValue.data(result.data!);
    } else {
      state = AsyncValue.error(result.exception!);
    }
  }
}
