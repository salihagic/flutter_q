import 'package:flutter_q/_all.dart';

class MovieGenres extends ConsumerWidget {
  final Movie movie;

  const MovieGenres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(genresStateNotifierProvider);

    return genres.when(
      initial: () => Container(),
      other: (_) => Container(),
      data: (items) {
        return Wrap(
          children: movie.genreIds
                  ?.map<Widget>(
                    (genreId) => GenreChip(
                      genre: items.firstWhere((genre) => genre.id == genreId),
                    ),
                  )
                  .toList() ??
              [],
        );
      },
      error: (_) => Container(),
      loading: () => const Loader(),
    );
  }
}
