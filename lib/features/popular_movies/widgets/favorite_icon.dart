import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<FavoriteMoviesBloc>().add(FavoriteMoviesToggleEvent(movie: movie)),
      child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
        builder: (context, favoriteMoviesState) {
          bool isSelected = favoriteMoviesState.items.any((x) => x.id == movie.id);

          return Icon(
            isSelected ? AppIcons.bookmark_checked : AppIcons.bookmark_empty,
            color: isSelected ? const Color(0xFFEC9B3E) : const Color(0xFFE4ECEF),
            size: 18,
          );
        },
      ),
    );
  }
}
