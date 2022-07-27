import 'package:flutter_q/_all.dart';

class MovieDetailsPage extends StatelessWidget {
  static const route = '/movie-details';

  final Movie movie;

  const MovieDetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: context.screenHeight * 0.4,
            leading: const BackArrow(),
            flexibleSpace: FlexibleSpaceBar(
              background: MovieDetailsImage(movie: movie),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsHeader(movie: movie),
                  const Gap(10),
                  Rating(movie: movie),
                  const Gap(10),
                  MovieGenres(movie: movie),
                  const Gap(30),
                  Text(
                    context.translations.description,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(10),
                  Text(
                    movie.overview.value,
                    style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13, height: 1.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
