import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_q/common/domain/notifiers/base_state.dart';
import 'package:flutter_q/common/domain/notifiers/base_state_notifier.dart';
import 'package:flutter_q/features/genres/data/repositories/genres_repository.dart';
import 'package:flutter_q/features/genres/domain/entities/genre.dart';
import 'package:flutter_q/features/genres/domain/notifiers/genres_notifier/genres_state.dart';

final genresStateNotifierProvider = StateNotifierProvider<GenresStateNotifier,
    BaseState<List<Genre>, GenresState>>(
  (ref) => GenresStateNotifier(
    ref,
    genresRepository: ref.read(genresRepositoryProvider),
  ),
);

class GenresStateNotifier extends BaseStateNotifier<List<Genre>, GenresState> {
  final GenresRepository genresRepository;

  GenresStateNotifier(
    super.ref, {
    required this.genresRepository,
  }) {
    load();
  }

  Future<void> load() async => execute(genresRepository.get());
}
