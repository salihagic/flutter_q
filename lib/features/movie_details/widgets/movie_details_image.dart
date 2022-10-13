import 'package:flutter_q/_all.dart';

class MovieDetailsImage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'movie-${movie.id}',
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedImage(url: movie.backdropPath.toNetworkImageUrl()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
