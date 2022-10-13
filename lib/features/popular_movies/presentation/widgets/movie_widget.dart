import 'package:flutter_q/_all.dart';

class MovieWidget extends ConsumerWidget {
  final Movie movie;

  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref.pushNamed(MovieDetailsPage.routeName, movie.id),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'movie-${movie.id}',
            child: CachedImage(
              width: context.screenWidth * 0.25,
              height: context.screenWidth * 0.25,
              url: movie.backdropPath.toNetworkImageUrl(),
            ),
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const Gap(10),
                Rating(movie: movie),
                const Gap(10),
                MovieGenres(movie: movie),
              ],
            ),
          ),
          const Gap(20),
          FavoriteIcon(movie: movie),
        ],
      ),
    );
  }
}
