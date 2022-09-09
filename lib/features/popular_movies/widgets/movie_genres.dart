import 'package:flutter_q/_all.dart';

class MovieGenres extends ConsumerWidget {
  const MovieGenres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(genresProvider);

    return genres.when(
      data: (data) {
        return Wrap(
          children: movie.genreIds
                  ?.map<Widget>(
                    (genreId) => GenreChip(genre: data.items.firstWhere((genre) => genre.id == genreId)),
                  )
                  .toList() ??
              [],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const Loader(),
    );
  }
}
