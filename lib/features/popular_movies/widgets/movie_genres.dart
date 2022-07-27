import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, genresState) {
        return Wrap(
          children: movie.genreIds
                  ?.map<Widget>(
                    (genreId) => GenreChip(genre: genresState.items.firstWhere((genre) => genre.id == genreId)),
                  )
                  .toList() ??
              [],
        );
      },
    );
  }
}
